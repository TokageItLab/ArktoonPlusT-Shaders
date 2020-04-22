uniform sampler2D _StencilMaskTex; uniform float4 _StencilMaskTex_ST; uniform int _StencilMaskTexUV;
uniform float _StencilMaskAdjust;
uniform float _StencilMaskAlphaDither;
uniform sampler2D _DitherMaskLOD2D;

float4 frag(VertexOutput i) : COLOR {

    // TransformUV
    // 時間
    float transformUVTime = _Time.b * 0.5;
    float2 fixedUV[3];
    // UV Channel0
    fixedUV[0] = i.uv0;
    fixedUV[1] = i.uv0;
    fixedUV[2] = i.uv0;
    // Ch1
    if (_UseTransformUV) {
        // Scroll
        if (_UseTransformUVScroll) {
            // r, g, b を uLength, vLength, scrollGroup とする
            float3 _TransformUVScrollMap_var = UNITY_SAMPLE_TEX2D(_TransformUVScrollMap, TRANSFORM_TEX(fixedUV[1], _TransformUVScrollMap)).rgb;
            // r, g を scrollSpeed, scrollDirection とする
            float2 _TransformUVScrollSpeedMap_var = UNITY_SAMPLE_TEX2D_SAMPLER(_TransformUVScrollSpeedMap, _TransformUVScrollMap, TRANSFORM_TEX(fixedUV[1], _TransformUVScrollSpeedMap)).rg;
            // 速度 0 とグループ指定がされていない物は計算しない
            if (_TransformUVScrollMap_var.b > 0.0 && _TransformUVScrollSpeedMap_var.r > 0.0) {
                // スクロール方向
                float transformUVScrollDirection = _TransformUVScrollSpeedMap_var.g * UNITY_PI * 2.0;
                // スクロール速度
                float transformUVScrollSpeed = abs(_TransformUVScrollSpeed) * _TransformUVScrollSpeedMap_var.r * 0.01;
                // 単位ベクトル（方向は 90 度でスナップ）
                float2 transformUVScrollVector = float2(-snapValue(cos(transformUVScrollDirection), 0.5), -snapValue(sin(transformUVScrollDirection),0.5));
                if (_TransformUVScrollSpeed < 0.0) {
                    transformUVScrollVector *= -1;
                }
                // 単位ベクトル * スクロール速度
                float2 transformUVScrollSpeedVector = transformUVScrollVector * transformUVScrollSpeed;
                // 移動値の計算
                float2 transformUVScrollPos = float2(transformUVScrollSpeedVector.x * transformUVTime, transformUVScrollSpeedVector.y * transformUVTime);
                // 移動値とスクロール幅のモジュロを取って UV に加算
                fixedUV[1].x += fmodWithSign(transformUVScrollPos.x, _TransformUVScrollMap_var.r);
                fixedUV[1].y += fmodWithSign(transformUVScrollPos.y, _TransformUVScrollMap_var.g);
                // 移動値が範囲を超えている場合一周させる
                float _TransformUVScrollMap_var2 = UNITY_SAMPLE_TEX2D(_TransformUVScrollMap, TRANSFORM_TEX(fixedUV[1], _TransformUVScrollMap)).b;
                if (_TransformUVScrollMap_var2 != _TransformUVScrollMap_var.b) {
                    fixedUV[1].x -= _TransformUVScrollMap_var.r * transformUVScrollVector.x;
                    fixedUV[1].y -= _TransformUVScrollMap_var.g * transformUVScrollVector.y;
                }
                fixedUV[1].x = fmodPositive(fixedUV[1].x, 1.0);
                fixedUV[1].y = fmodPositive(fixedUV[1].y, 1.0);
            }
        }
        // Rotate
        if (_UseTransformUVRotate) {
            // r, g を xPivotPos, yPivotPos とする
            float3 _TransformUVRotateMap_var = UNITY_SAMPLE_TEX2D(_TransformUVRotateMap, TRANSFORM_TEX(fixedUV[1], _TransformUVRotateMap)).rgb;
            // r, g を rightRotSpeed, leftRotSpeed とする
            float2 _TransformUVRotateSpeedMap_var = UNITY_SAMPLE_TEX2D_SAMPLER(_TransformUVRotateSpeedMap, _TransformUVRotateMap, TRANSFORM_TEX(fixedUV[1], _TransformUVRotateSpeedMap)).rg;
            // 回転速度
            float transformUVRotateSpeed = _TransformUVRotateSpeed * (_TransformUVRotateSpeedMap_var.r - _TransformUVRotateSpeedMap_var.g);
            // 速度 0 は計算しない
            if (transformUVRotateSpeed != 0.0) {
                // 中心点 Unity は UV の V が下方向なので反転
                float2 transformUVRotatePivot = float2(_TransformUVRotateMap_var.r, 1.0 - _TransformUVRotateMap_var.g);
                // 回転
                float transformUVRotateCosTheta = cos(transformUVRotateSpeed * transformUVTime);
                float transformUVRotateSinTheta = sin(transformUVRotateSpeed * transformUVTime);
                fixedUV[1] = float2(
                    (transformUVRotateCosTheta * (fixedUV[1].x - transformUVRotatePivot.x) - transformUVRotateSinTheta * (fixedUV[1].y - transformUVRotatePivot.y) + transformUVRotatePivot.x),
                    (transformUVRotateSinTheta * (fixedUV[1].x - transformUVRotatePivot.x) + transformUVRotateCosTheta * (fixedUV[1].y - transformUVRotatePivot.y) + transformUVRotatePivot.y)
                );
            }
        }
    }
    // Ch2
    if (_UseTransformUV2) {
        // Scroll
        if (_UseTransformUV2Scroll) {
            // r, g, b を uLength, vLength, scrollGroup とする
            float3 _TransformUV2ScrollMap_var = UNITY_SAMPLE_TEX2D(_TransformUV2ScrollMap, TRANSFORM_TEX(fixedUV[2], _TransformUV2ScrollMap)).rgb;
            // r, g を scrollSpeed, scrollDirection とする
            float2 _TransformUV2ScrollSpeedMap_var = UNITY_SAMPLE_TEX2D_SAMPLER(_TransformUV2ScrollSpeedMap, _TransformUV2ScrollMap, TRANSFORM_TEX(fixedUV[2], _TransformUV2ScrollSpeedMap)).rg;
            // 速度 0 とグループ指定がされていない物は計算しない
            if (_TransformUV2ScrollMap_var.b > 0.0 && _TransformUV2ScrollSpeedMap_var.r > 0.0) {
                // スクロール方向
                float transformUV2ScrollDirection = _TransformUV2ScrollSpeedMap_var.g * UNITY_PI * 2.0;
                // スクロール速度
                float transformUV2ScrollSpeed = abs(_TransformUV2ScrollSpeed) * _TransformUV2ScrollSpeedMap_var.r * 0.01;
                // 単位ベクトル（方向は90度でスナップ）
                float2 transformUV2ScrollVector = float2(-snapValue(cos(transformUV2ScrollDirection),0.5), -snapValue(sin(transformUV2ScrollDirection),0.5));
                if (_TransformUV2ScrollSpeed < 0.0) {
                    transformUV2ScrollVector *= -1;
                }
                // 単位ベクトル * スクロール速度
                float2 transformUV2ScrollSpeedVector = transformUV2ScrollVector * transformUV2ScrollSpeed;
                // 移動値の計算
                float2 transformUV2ScrollPos = float2(transformUV2ScrollSpeedVector.x * transformUVTime, transformUV2ScrollSpeedVector.y * transformUVTime);
                // 移動値とスクロール幅のモジュロを取って UV に加算
                fixedUV[2].x += fmodWithSign(transformUV2ScrollPos.x, _TransformUV2ScrollMap_var.r);
                fixedUV[2].y += fmodWithSign(transformUV2ScrollPos.y, _TransformUV2ScrollMap_var.g);
                // 移動値が範囲を超えている場合一周させる
                float _TransformUV2ScrollMap_var2 = UNITY_SAMPLE_TEX2D(_TransformUV2ScrollMap, TRANSFORM_TEX(fixedUV[2], _TransformUV2ScrollMap)).b;
                if (_TransformUV2ScrollMap_var2 != _TransformUV2ScrollMap_var.b) {
                    fixedUV[2].x -= _TransformUV2ScrollMap_var.r * transformUV2ScrollVector.x;
                    fixedUV[2].y -= _TransformUV2ScrollMap_var.g * transformUV2ScrollVector.y;
                }
                fixedUV[2].x = fmodPositive(fixedUV[2].x, 1.0);
                fixedUV[2].y = fmodPositive(fixedUV[2].y, 1.0);
            }
        }
        // Rotate
        if (_UseTransformUV2Rotate) {
            // r, g を xPivotPos, yPivotPos とする
            float3 _TransformUV2RotateMap_var = UNITY_SAMPLE_TEX2D(_TransformUV2RotateMap, TRANSFORM_TEX(fixedUV[2], _TransformUV2RotateMap)).rgb;
            // r, g を rightRotSpeed, leftRotSpeed とする
            float2 _TransformUV2RotateSpeedMap_var = UNITY_SAMPLE_TEX2D_SAMPLER(_TransformUV2RotateSpeedMap, _TransformUV2RotateMap, TRANSFORM_TEX(fixedUV[2], _TransformUV2RotateSpeedMap)).rg;
            // 回転速度
            float transformUV2RotateSpeed = _TransformUV2RotateSpeed * (_TransformUV2RotateSpeedMap_var.r - _TransformUV2RotateSpeedMap_var.g);
            // 速度 0 は計算しない
            if (transformUV2RotateSpeed != 0.0) {
                // 中心点 Unity は UV の V が下方向なので反転
                float2 transformUV2RotatePivot = float2(_TransformUV2RotateMap_var.r, 1.0 - _TransformUV2RotateMap_var.g);
                // 回転
                float transformUV2RotateCosTheta = cos(transformUV2RotateSpeed * transformUVTime);
                float transformUV2RotateSinTheta = sin(transformUV2RotateSpeed * transformUVTime);
                fixedUV[2] = float2(
                    (transformUV2RotateCosTheta * (fixedUV[2].x - transformUV2RotatePivot.x) - transformUV2RotateSinTheta * (fixedUV[2].y - transformUV2RotatePivot.y) + transformUV2RotatePivot.x),
                    (transformUV2RotateSinTheta * (fixedUV[2].x - transformUV2RotatePivot.x) + transformUV2RotateCosTheta * (fixedUV[2].y - transformUV2RotatePivot.y) + transformUV2RotatePivot.y)
                );
            }
        }
    }

    // MainTex, Color, StencilMask情報をもとにClipするだけ
    float4 _MainTex_var = UNITY_SAMPLE_TEX2D(_MainTex, TRANSFORM_TEX(fixedUV[_MainTexUV], _MainTex));
    float4 _StencilMaskTex_var = tex2D(_StencilMaskTex,TRANSFORM_TEX(fixedUV[_StencilMaskTexUV], _StencilMaskTex));

    clip(min((_MainTex_var.a *_Color.a) - _CutoutCutoutAdjust, _StencilMaskTex_var - _StencilMaskAdjust));

    // _DitherMaskLOD2Dを使って更にclipする
    float4 pos = i.pos;
    pos *= 0.25;
    pos.y = frac(pos.y) * 0.0625;
    pos.y += _StencilMaskAlphaDither * 0.9375;
    clip(tex2D(_DitherMaskLOD2D, pos).a - 0.5);

    float4 finalRGBA = float4(0,0,0,0);
    return finalRGBA;
}