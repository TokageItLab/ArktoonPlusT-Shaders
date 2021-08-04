// Arktoon+T-Shaders
// Copyright (c) 2020-2021 Tokage IT Lab.
// Copyright (c) 2018 synqark
// This code is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

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

    float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir * lerp(1, i.faceSign, _DoubleSidedFlipBackfaceNormal));
    float3 viewDirection = normalize(UnityWorldSpaceViewDir(i.posWorld.xyz));
    float3 _BumpMap_var = UnpackScaleNormal(tex2D(REF_BUMPMAP,TRANSFORM_TEX(fixedUV[REF_BUMPMAPUV], REF_BUMPMAP)), REF_BUMPSCALE);
    float3 normalLocal = _BumpMap_var.rgb;
    float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
    float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz + float3(0, +0.0000000001, 0));
    float3 lightColor = _LightColor0.rgb;
    float _LightColorSaturationMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_LightColorSaturationMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_LightColorSaturationMaskUV], _LightColorSaturationMask));
    float lightColorSaturation = _LightColorSaturation * _LightColorSaturationMask_var;
    lightColor = CalculateHSV(lightColor,1.0,lightColorSaturation,1.0);
    float3 halfDirection = normalize(viewDirection+lightDirection);
    float3 cameraSpaceViewDir = mul((float3x3)unity_WorldToCamera, viewDirection);
    #if !defined(SHADOWS_SCREEN)
        float attenuation = 1;
    #else
        UNITY_LIGHT_ATTENUATION(attenuation, i, i.posWorld.xyz);
    #endif

    float4 _MainTex_var = UNITY_SAMPLE_TEX2D(REF_MAINTEX, TRANSFORM_TEX(fixedUV[REF_MAINTEXUV], REF_MAINTEX));
    float3 Diffuse = (_MainTex_var.rgb*REF_COLOR.rgb);
    Diffuse = lerp(Diffuse, Diffuse * i.color,_VertexColorBlendDiffuse);

    // アウトラインであればDiffuseとColorを混ぜる
    if (_OutlineUseColorShift) {
        float3 Outline_Diff_HSV = CalculateHSV((Diffuse * _OutlineTextureColorRate + mad(i.col, - _OutlineTextureColorRate,i.col)), _OutlineHueShiftFromBase, _OutlineSaturationFromBase, _OutlineValueFromBase);
        Diffuse = lerp(Diffuse, Outline_Diff_HSV, i.isOutline);
    } else {
        Diffuse = lerp(Diffuse, (Diffuse * _OutlineTextureColorRate + mad(i.col,-_OutlineTextureColorRate,i.col)), i.isOutline);
    }

    #ifdef ARKTOON_CUTOUT
        clip((_MainTex_var.a * REF_COLOR.a) - _CutoutCutoutAdjust);
    #endif

    #if defined(ARKTOON_CUTOUT) || defined(ARKTOON_FADE)
        if (i.isOutline) {
            float _OutlineMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_OutlineMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_OutlineMaskUV], _OutlineMask)).r;
            clip(_OutlineMask_var.r - _OutlineCutoffRange);
        }
    #endif

    // 光源サンプリング方法(0:Arktoon, 1:Cubed)
    float3 ShadeSH9Plus = float3(0,0,0);
    float3 ShadeSH9Minus = float3(0,0,0);
    if (_LightSampling == 0) {
        // 明るい部分と暗い部分をサンプリング・グレースケールでリマッピングして全面の光量を再計算
        ShadeSH9Plus = GetSHLength();
        ShadeSH9Minus = ShadeSH9(float4(0,0,0,1));
    } else {
        // 空間上、真上を向いたときの光と真下を向いたときの光でサンプリング
        ShadeSH9Plus = ShadeSH9Direct();
        ShadeSH9Minus = ShadeSH9Indirect();
    }

    // 陰の計算
    float3 directLighting = saturate((ShadeSH9Plus+lightColor));
    ShadeSH9Minus *= _ShadowIndirectIntensity;
    float3 indirectLighting = saturate(ShadeSH9Minus);

    float3 grayscale_vector = grayscale_vector_node();
    float grayscalelightcolor = dot(lightColor,grayscale_vector);
    float grayscaleDirectLighting = (((dot(lightDirection,normalDirection)*0.5+0.5)*grayscalelightcolor*attenuation)+dot(ShadeSH9Normal( normalDirection ),grayscale_vector));
    float bottomIndirectLighting = dot(ShadeSH9Minus,grayscale_vector);
    float topIndirectLighting = dot(ShadeSH9Plus,grayscale_vector);
    float lightDifference = ((topIndirectLighting+grayscalelightcolor)-bottomIndirectLighting);
    float remappedLight = ((grayscaleDirectLighting-bottomIndirectLighting)/lightDifference);
    float _ShadowStrengthMask_var = tex2D(_ShadowStrengthMask, TRANSFORM_TEX(fixedUV[_ShadowStrengthMaskUV], _ShadowStrengthMask));

    fixed _ShadowborderBlur_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowborderBlurMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowborderBlurMaskUV], _ShadowborderBlurMask)).r * _ShadowborderBlur;
    //0< _Shadowborder< 1,0 < _ShadowborderBlur < 1 より  _Shadowborder - _ShadowborderBlur_var/2 < 1 , 0 < _Shadowborder + _ShadowborderBlur_var/2
    //float ShadowborderMin = max(0, _Shadowborder - _ShadowborderBlur_var/2);
    //float ShadowborderMax = min(1, _Shadowborder + _ShadowborderBlur_var/2);
    float ShadowborderMin = saturate(_Shadowborder - _ShadowborderBlur_var/2);//この場合saturateはコスト０でmaxより軽量です
    float ShadowborderMax = saturate(_Shadowborder + _ShadowborderBlur_var/2);//この場合saturateはコスト０でminより軽量です
    float grayscaleDirectLighting2 = (((dot(lightDirection,normalDirection)*0.5+0.5)*grayscalelightcolor) + dot(ShadeSH9Normal( normalDirection ),grayscale_vector));
    float remappedLight2 = ((grayscaleDirectLighting2-bottomIndirectLighting)/lightDifference);
    float directContribution = 1.0 - ((1.0 - saturate(( (saturate(remappedLight2) - ShadowborderMin)) / (ShadowborderMax - ShadowborderMin))));

    float selfShade = saturate(dot(lightDirection,normalDirection)+1+_OtherShadowAdjust);
    float otherShadow = saturate(saturate(mad(attenuation,2 ,-1))+mad(_OtherShadowBorderSharpness,-selfShade,_OtherShadowBorderSharpness));
    float tmpDirectContributionFactor0 = saturate(dot(lightColor,grayscale_for_light())*1.5);
    directContribution = lerp(0, directContribution, saturate(1-(mad(tmpDirectContributionFactor0,-otherShadow,tmpDirectContributionFactor0))));

    // #ifdef USE_SHADOW_STEPS
        directContribution = lerp(directContribution, min(1,floor(directContribution * _ShadowSteps) / (_ShadowSteps - 1)), _ShadowUseStep);
    // #endif
    float tmpDirectContributionFactor1 = _ShadowStrengthMask_var * _ShadowStrength;
    directContribution = 1.0 - mad(tmpDirectContributionFactor1,-directContribution,tmpDirectContributionFactor1);

    // 光の受光に関する更なる補正
    // ・LightIntensityIfBackface(裏面を描画中に変動する受光倍率)
    // ・ShadowCapのModeがLightShutterの時にかかるマスク乗算
    float additionalContributionMultiplier = i.lightIntensityIfBackface;

    if (_ShadowCapBlendMode == 2) { // Light Shutter
        float3 normalDirectionShadowCap = normalize(mul( float3(normalLocal.r*_ShadowCapNormalMix,normalLocal.g*_ShadowCapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
        float2 transformShadowCap = ComputeTransformCap(cameraSpaceViewDir,normalDirectionShadowCap);
        float4 _ShadowCapTexture_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapTexture, REF_MAINTEX, TRANSFORM_TEX(transformShadowCap, _ShadowCapTexture));
        float4 _ShadowCapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowCapBlendMaskUV], _ShadowCapBlendMask));
        additionalContributionMultiplier *= saturate(1.0 - mad(_ShadowCapBlendMask_var.rgb,-_ShadowCapTexture_var.rgb,_ShadowCapBlendMask_var.rgb)*_ShadowCapBlend);
    }

    directContribution *= additionalContributionMultiplier;

    // 頂点ライティング：PixelLightから溢れた4光源をそれぞれ計算
    float3 coloredLight_sum = float3(0,0,0);
    if (_UseVertexLight) {
        fixed _PointShadowborderBlur_var = UNITY_SAMPLE_TEX2D_SAMPLER(_PointShadowborderBlurMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_PointShadowborderBlurMaskUV], _PointShadowborderBlurMask)).r * _PointShadowborderBlur;
        float VertexShadowborderMin = saturate(-_PointShadowborderBlur_var*0.5+_PointShadowborder);
        float VertexShadowborderMax = saturate(_PointShadowborderBlur_var*0.5+_PointShadowborder);
        float4 directContributionVertex = 1.0 - ((1.0 - saturate(( (saturate(i.ambientAttenuation) - VertexShadowborderMin)) / (VertexShadowborderMax - VertexShadowborderMin))));
        // #ifdef USE_POINT_SHADOW_STEPS
            directContributionVertex = lerp(directContributionVertex, min(1,floor(directContributionVertex * _PointShadowSteps) / (_PointShadowSteps - 1)), _PointShadowUseStep);
        // #endif
        directContributionVertex *= additionalContributionMultiplier;
        //ベクトル演算を減らしつつ、複数のスカラー演算を一つのベクトル演算にまとめました。
        //現代のPC向けGPUはほぼ100%がスカラー型であり、ベクトル演算は基本的にその次元数分ALU負荷が倍増します。
        //複数の掛け算は基本的にスカラーを左に寄せるだけでベクトル演算が減って最適化に繋がります。
        float4 tmpColoredLightFactorAttenuated = directContributionVertex * i.ambientAttenuation;
        float4 tmpColoredLightFactorIndirect = mad(i.ambientIndirect,-_PointShadowStrength,i.ambientIndirect);
        float3 coloredLight_0 = max(tmpColoredLightFactorAttenuated.r ,tmpColoredLightFactorIndirect.r) * i.lightColor0;
        float3 coloredLight_1 = max(tmpColoredLightFactorAttenuated.g ,tmpColoredLightFactorIndirect.g) * i.lightColor1;
        float3 coloredLight_2 = max(tmpColoredLightFactorAttenuated.b ,tmpColoredLightFactorIndirect.b) * i.lightColor2;
        float3 coloredLight_3 = max(tmpColoredLightFactorAttenuated.a ,tmpColoredLightFactorIndirect.a) * i.lightColor3;
        coloredLight_sum = (coloredLight_0 + coloredLight_1 + coloredLight_2 + coloredLight_3) * _PointAddIntensity;
        coloredLight_sum = CalculateHSV(coloredLight_sum,1.0,lightColorSaturation,1.0);
    }

    float3 finalLight = lerp(indirectLighting,directLighting,directContribution)+coloredLight_sum;
    
    // カスタム陰を使っている場合、directContributionや直前のfinalLightを使い、finalLightを上書きする
    float3 toonedMap = float3(0,0,0);
    if (_ShadowPlanBUsePlanB) {
        float3 shadeMixValue = lerp(directLighting, finalLight, _ShadowPlanBDefaultShadowMix);
        float3 ShadeMap = float3(0,0,0);
        if (_ShadowPlanBUseCustomShadowTexture) {
            float4 _ShadowPlanBCustomShadowTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowPlanBCustomShadowTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowPlanBCustomShadowTextureUV], _ShadowPlanBCustomShadowTexture));
            float3 shadowCustomTexture = _ShadowPlanBCustomShadowTexture_var.rgb * _ShadowPlanBCustomShadowTextureRGB.rgb;
            ShadeMap = shadowCustomTexture*shadeMixValue;
        } else {
            float3 Diff_HSV = CalculateHSV(Diffuse, _ShadowPlanBHueShiftFromBase, _ShadowPlanBSaturationFromBase, _ShadowPlanBValueFromBase);
            ShadeMap = Diff_HSV*shadeMixValue;
        }

        if (_CustomShadow2nd) {
            float ShadowborderMin2 = saturate((_ShadowPlanB2border * _Shadowborder) - _ShadowPlanB2borderBlur/2);
            float ShadowborderMax2 = saturate((_ShadowPlanB2border * _Shadowborder) + _ShadowPlanB2borderBlur/2);
            float directContribution2 = 1.0 - ((1.0 - saturate(( (saturate(remappedLight2) - ShadowborderMin2)) / (ShadowborderMax2 - ShadowborderMin2))));  // /2の部分をパラメーターにしたい
            directContribution2 *= additionalContributionMultiplier;
            float3 ShadeMap2 = float3(0,0,0);
            if (_ShadowPlanB2UseCustomShadowTexture) {
                float4 _ShadowPlanB2CustomShadowTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowPlanB2CustomShadowTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowPlanB2CustomShadowTextureUV], _ShadowPlanB2CustomShadowTexture));
                float3 shadowCustomTexture2 = _ShadowPlanB2CustomShadowTexture_var.rgb * _ShadowPlanB2CustomShadowTextureRGB.rgb;
                shadowCustomTexture2 =  lerp(shadowCustomTexture2, shadowCustomTexture2 * i.color,_VertexColorBlendDiffuse); // 頂点カラーを合成
                ShadeMap2 = shadowCustomTexture2*shadeMixValue;
            } else {
                float3 Diff_HSV2 = CalculateHSV(Diffuse, _ShadowPlanB2HueShiftFromBase, _ShadowPlanB2SaturationFromBase, _ShadowPlanB2ValueFromBase);
                ShadeMap2 = Diff_HSV2*shadeMixValue;
            }
            ShadeMap = lerp(ShadeMap2,ShadeMap,directContribution2);
        }

        finalLight = lerp(ShadeMap,directLighting,directContribution)+coloredLight_sum;
        toonedMap = lerp(ShadeMap,Diffuse*finalLight,finalLight);
    } else {
        toonedMap = Diffuse*finalLight;
    }

    float3 tmpToonedMapFactor = (Diffuse+(Diffuse*coloredLight_sum));
    // アウトラインであればShadeMixを反映
    toonedMap = lerp(toonedMap, (toonedMap * _OutlineShadeMix + mad(tmpToonedMapFactor,-_OutlineShadeMix,tmpToonedMapFactor)), i.isOutline);

    // 裏面であればHSVShiftを反映
    if(_DoubleSidedBackfaceUseColorShift) {
        toonedMap = lerp(toonedMap, CalculateHSV(toonedMap, _DoubleSidedBackfaceHueShiftFromBase, _DoubleSidedBackfaceSaturationFromBase, _DoubleSidedBackfaceValueFromBase), i.isBackface);
        Diffuse = lerp(Diffuse, CalculateHSV(Diffuse, _DoubleSidedBackfaceHueShiftFromBase, _DoubleSidedBackfaceSaturationFromBase, _DoubleSidedBackfaceValueFromBase), i.isBackface);
    }

    float3 ReflectionMap = float3(0,0,0);
    float3 specular = float3(0,0,0);
    float3 matcap = float3(0,0,0);
    float3 RimLight = float3(0,0,0);
    float3 shadowcap = float3(1000,1000,1000);

    #if !defined(ARKTOON_REFRACTED)
    if (_UseOutline == 0 || !i.isOutline) {
    #endif
        // オプション：Reflection
        if (_UseReflection) {
            float3 _ReflectionTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ReflectionTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ReflectionTextureUV], _ReflectionTexture)).rgb;
            float3 reflectionColor = _ReflectionColor.rgb * _ReflectionTexture_var;
            float3 normalDirectionReflection = normalize(mul( float3(normalLocal.rg*_ReflectionNormalMix,normalLocal.b), tangentTransform ));
            float reflNdotV = abs(dot( normalDirectionReflection, viewDirection ));
            float _ReflectionSmoothnessMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ReflectionReflectionMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ReflectionReflectionMaskUV], _ReflectionReflectionMask));
            float reflectionSmoothness = _ReflectionReflectionPower*_ReflectionSmoothnessMask_var;
            float perceptualRoughnessRefl = 1.0 - reflectionSmoothness;
            float3 reflDir = reflect(-viewDirection, normalDirectionReflection);
            float roughnessRefl = SmoothnessToRoughness(reflectionSmoothness);
            float3 indirectSpecular = float3(0,0,0);
            if (_UseReflectionProbe) {
                indirectSpecular = GetIndirectSpecular(lightColor, lightDirection,
                    normalDirectionReflection, viewDirection, reflDir, attenuation, roughnessRefl, i.posWorld.xyz
                );
                if (any(indirectSpecular.xyz) == 0) indirectSpecular = GetIndirectSpecularCubemap(_ReflectionCubemap, _ReflectionCubemap_HDR, reflDir, roughnessRefl);
            } else {
                indirectSpecular = GetIndirectSpecularCubemap(_ReflectionCubemap, _ReflectionCubemap_HDR, reflDir, roughnessRefl);
            }
            float3 specularColorRefl = reflectionSmoothness;
            float specularMonochromeRefl;
            float3 diffuseColorRefl = Diffuse;
            diffuseColorRefl = DiffuseAndSpecularFromMetallic( diffuseColorRefl, specularColorRefl, specularColorRefl, specularMonochromeRefl );
            specularMonochromeRefl = 1.0-specularMonochromeRefl;
            half grazingTermRefl = saturate( reflectionSmoothness + specularMonochromeRefl );
            #ifdef UNITY_COLORSPACE_GAMMA
                half surfaceReduction = 1.0-0.28*roughnessRefl*perceptualRoughnessRefl;
            #else
                half surfaceReduction = rcp(roughnessRefl*roughnessRefl + 1.0);
            #endif
            indirectSpecular *= FresnelLerp (specularColorRefl, grazingTermRefl, reflNdotV);
            indirectSpecular *= surfaceReduction *lerp(float3(1,1,1), finalLight,_ReflectionShadeMix);
            float reflSuppress = _ReflectionSuppressBaseColorValue * reflectionSmoothness;
            toonedMap = lerp(toonedMap,mad(toonedMap,-surfaceReduction,toonedMap), reflSuppress);
            ReflectionMap = indirectSpecular*lerp(float3(1,1,1), finalLight,_ReflectionShadeMix)*reflectionColor;
        }

        // オプション：Gloss
        if(_UseGloss) {
            float glossNdotV = abs(dot( normalDirection, viewDirection ));
            float _GlossBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_GlossBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_GlossBlendMaskUV], _GlossBlendMask));
            float gloss = _GlossBlend * _GlossBlendMask_var;
            float perceptualRoughness = 1.0 - gloss;
            float roughness = perceptualRoughness * perceptualRoughness;
            float specPow = exp2( gloss * 10.0+1.0);
            float NdotL = saturate(dot( normalDirection, lightDirection ));
            float LdotH = saturate(dot(lightDirection, halfDirection));
            float _GlossPowerMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_GlossPowerMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_GlossPowerMaskUV], _GlossPowerMask)).r;
            float3 specularColor = _GlossPower * _GlossPowerMask_var;
            float specularMonochrome;
            float3 diffuseColor = Diffuse;
            diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
            specularMonochrome = 1.0-specularMonochrome;
            float NdotH = saturate(dot( normalDirection, halfDirection ));
            float VdotH = saturate(dot( viewDirection, halfDirection ));
            float visTerm = SmithJointGGXVisibilityTerm( NdotL, glossNdotV, roughness );
            float normTerm = GGXTerm(NdotH, roughness);
            float specularPBL = (visTerm*normTerm) * UNITY_PI;
            #ifdef UNITY_COLORSPACE_GAMMA
                specularPBL = sqrt(max(1e-4h, specularPBL));
            #endif
            specularPBL = max(0, specularPBL * NdotL);
            #if defined(_SPECULARHIGHLIGHTS_OFF)
                specularPBL = 0.0;
            #endif
            specularPBL *= any(specularColor) ? 1.0 : 0.0;
            float3 attenColor = attenuation * lightColor.rgb;
            float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
            half grazingTerm = saturate( gloss + specularMonochrome );
            float3 _GlossTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_GlossTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_GlossTextureUV], _GlossTexture)).rgb;
            specular = attenuation * directSpecular * _GlossTexture_var * _GlossColor.rgb;
        }

        // オプション：MatCap
        if (_MatcapBlendMode < 3) {
            float3 normalDirectionMatcap = normalize(mul( float3(normalLocal.r*_MatcapNormalMix,normalLocal.g*_MatcapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
            float2 transformMatcap = ComputeTransformCap(cameraSpaceViewDir,normalDirectionMatcap);
            float4 _MatcapTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_MatcapTexture, REF_MAINTEX, TRANSFORM_TEX(transformMatcap, _MatcapTexture));
            float4 _MatcapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_MatcapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_MatcapBlendMaskUV], _MatcapBlendMask));
            matcap = ((_MatcapColor.rgb*_MatcapTexture_var.rgb)*_MatcapBlendMask_var.rgb*_MatcapBlend) * lerp(float3(1,1,1), finalLight,_MatcapShadeMix);
        }

        // オプション：Rim
        if (_UseRim) {
            float _RimBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_RimBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_RimBlendMaskUV], _RimBlendMask));
            float4 _RimTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_RimTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_RimTextureUV], _RimTexture));
            RimLight = (
                            lerp( _RimTexture_var.rgb, Diffuse, _RimUseBaseTexture )
                            * pow(
                                saturate(1.0 - saturate(dot(normalDirection * lerp(i.faceSign, 1, _DoubleSidedFlipBackfaceNormal), viewDirection) ) + _RimUpperSideWidth)
                                , _RimFresnelPower
                                )
                            * _RimBlend
                            * _RimColor.rgb
                            * _RimBlendMask_var
                            * lerp(float3(1,1,1), finalLight,_RimShadeMix)
                        );
        }

        // オプション:ShadeCap
        if (_ShadowCapBlendMode < 2) {
            float3 normalDirectionShadowCap = normalize(mul( float3(normalLocal.r*_ShadowCapNormalMix,normalLocal.g*_ShadowCapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
            float2 transformShadowCap = ComputeTransformCap(cameraSpaceViewDir,normalDirectionShadowCap);
            float4 _ShadowCapTexture_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapTexture, REF_MAINTEX, TRANSFORM_TEX(transformShadowCap, _ShadowCapTexture));
            float4 _ShadowCapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowCapBlendMaskUV], _ShadowCapBlendMask));
            shadowcap = (1.0 - mad(_ShadowCapBlendMask_var.rgb,-(_ShadowCapTexture_var.rgb),_ShadowCapBlendMask_var.rgb)*_ShadowCapBlend);
        }
    #if !defined(ARKTOON_REFRACTED)
    }
    #endif

    float3 finalcolor2 = toonedMap + ReflectionMap + specular;

    // ShadeCapのブレンドモード
    if (_ShadowCapBlendMode == 0) { // Darken
        finalcolor2 = min(finalcolor2, shadowcap);
    } else if  (_ShadowCapBlendMode == 1) { // Multiply
        finalcolor2 = finalcolor2 * shadowcap;
    }

    // MatCapのブレンドモード
    if (_MatcapBlendMode == 0) { // Add
        finalcolor2 = finalcolor2 + matcap;
    } else if (_MatcapBlendMode == 1) { // Lighten
        finalcolor2 = max(finalcolor2, matcap);
    } else if (_MatcapBlendMode == 2) { // Screen
        finalcolor2 = 1-(1-finalcolor2) * (1-matcap);
    }

    // 屈折
    #ifdef ARKTOON_REFRACTED
        float refractionValue = pow(1.0-saturate(dot(normalDirection, viewDirection)),_RefractionFresnelExp);
        float2 sceneUVs = (i.grabUV) + ((refractionValue*_RefractionStrength) * mul(unity_WorldToCamera, float4(normalDirection,0) ).xyz.rgb.rg);
        float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
    #endif


    // Emission Parallax
    float3 emissionParallax = float3(0,0,0);
    if(_UseEmissionParallax) {
        float _EmissionParallaxDepthMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionParallaxDepthMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissionParallaxDepthMaskUV], _EmissionParallaxDepthMask)).r;
        float2 emissionParallaxTransform = _EmissionParallaxDepth * (_EmissionParallaxDepthMask_var - _EmissionParallaxDepthMaskInvert) * mul(tangentTransform, viewDirection).xy + fixedUV[_EmissionParallaxTexUV];
        float _EmissionMask_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionParallaxMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissionParallaxMaskUV], _EmissionParallaxMask)).r;
        float4 _EmissionParallaxTex_var4 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionParallaxTex, REF_MAINTEX, TRANSFORM_TEX(emissionParallaxTransform, _EmissionParallaxTex)).rgba;
        float3 _EmissionParallaxTex_var = _EmissionParallaxTex_var4.rgb * _EmissionParallaxTex_var4.a * _EmissionParallaxColor.rgb;
        emissionParallax = _EmissionParallaxTex_var * _EmissionMask_var;
    }

    #ifdef ARKTOON_EMISSIVE_FREAK
        float time = _Time.r;

        float2 emissiveFreak1uv = fixedUV[_EmissiveFreak1TexUV] + float2(fmod(_EmissiveFreak1U * time, 1.0 / _EmissiveFreak1Tex_ST.x), fmod(time * _EmissiveFreak1V, 1.0 / _EmissiveFreak1Tex_ST.y));
        float _EmissiveFreak1DepthMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak1DepthMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveFreak1DepthMaskUV], _EmissiveFreak1DepthMask)).r;
        float2 emissiveFreak1Transform = _EmissiveFreak1Depth * (_EmissiveFreak1DepthMask_var - _EmissiveFreak1DepthMaskInvert) * mul(tangentTransform, viewDirection).xy + emissiveFreak1uv;
        float _EmissiveFreak1Mask_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak1Mask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveFreak1MaskUV], _EmissiveFreak1Mask)).r;
        float4 _EmissiveFreak1Tex_var4 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak1Tex, REF_MAINTEX, TRANSFORM_TEX(emissiveFreak1Transform, _EmissiveFreak1Tex)).rgba;
        float3 _EmissiveFreak1Tex_var = _EmissiveFreak1Tex_var4.rgb * _EmissiveFreak1Color.rgb * _EmissiveFreak1Tex_var4.a;
        float emissiveFreak1Breathing = cos(_EmissiveFreak1Breathing*time) * 0.5 + 0.5;//sin(x+π/2)=cos(x)
        float emissiveFreak1BlinkOut = 1 - ((_EmissiveFreak1BlinkOut*time) % 1.0);
        float emissiveFreak1BlinkIn = (_EmissiveFreak1BlinkIn*time) % 1.0;
        float emissiveFreak1Hue = (_EmissiveFreak1HueShift*time) % 1.0;
        _EmissiveFreak1Tex_var = CalculateHSV(_EmissiveFreak1Tex_var, emissiveFreak1Hue, 1.0, 1.0);
        float3 emissiveFreak1 = _EmissiveFreak1Tex_var * _EmissiveFreak1Mask_var;
        emissiveFreak1 = lerp(emissiveFreak1, emissiveFreak1 * emissiveFreak1Breathing, _EmissiveFreak1BreathingMix);
        emissiveFreak1 = lerp(emissiveFreak1, emissiveFreak1 * emissiveFreak1BlinkOut, _EmissiveFreak1BlinkOutMix);
        emissiveFreak1 = lerp(emissiveFreak1, emissiveFreak1 * emissiveFreak1BlinkIn, _EmissiveFreak1BlinkInMix);

        float2 emissiveFreak2uv = fixedUV[_EmissiveFreak2TexUV] + float2(fmod(_EmissiveFreak2U * time, 1.0 / _EmissiveFreak2Tex_ST.x), fmod(time * _EmissiveFreak2V, 1.0 / _EmissiveFreak2Tex_ST.y));
        float _EmissiveFreak2DepthMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak2DepthMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveFreak2DepthMaskUV], _EmissiveFreak2DepthMask)).r;
        float2 emissiveFreak2Transform = _EmissiveFreak2Depth * (_EmissiveFreak2DepthMask_var - _EmissiveFreak2DepthMaskInvert) * mul(tangentTransform, viewDirection).xy + emissiveFreak2uv;
        float _EmissiveFreak2Mask_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak2Mask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveFreak2MaskUV], _EmissiveFreak2Mask)).r;
        float4 _EmissiveFreak2Tex_var4 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveFreak2Tex, REF_MAINTEX, TRANSFORM_TEX(emissiveFreak2Transform, _EmissiveFreak2Tex)).rgba;
        float3 _EmissiveFreak2Tex_var = _EmissiveFreak2Tex_var4.rgb * _EmissiveFreak2Color.rgb * _EmissiveFreak2Tex_var4.a;
        float emissiveFreak2Breathing = cos(_EmissiveFreak2Breathing*time) * 0.5 + 0.5;//sin(x+π/2)=cos(x)
        float emissiveFreak2BlinkOut = 1 - ((_EmissiveFreak2BlinkOut*time) % 1.0);
        float emissiveFreak2BlinkIn = (_EmissiveFreak2BlinkIn*time) % 1.0;
        float emissiveFreak2Hue = (_EmissiveFreak2HueShift*time) % 1.0;
        _EmissiveFreak2Tex_var = CalculateHSV(_EmissiveFreak2Tex_var, emissiveFreak2Hue, 1.0, 1.0);
        float3 emissiveFreak2 = _EmissiveFreak2Tex_var * _EmissiveFreak2Mask_var;
        emissiveFreak2 = lerp(emissiveFreak2, emissiveFreak2 * emissiveFreak2Breathing, _EmissiveFreak2BreathingMix);
        emissiveFreak2 = lerp(emissiveFreak2, emissiveFreak2 * emissiveFreak2BlinkOut, _EmissiveFreak2BlinkOutMix);
        emissiveFreak2 = lerp(emissiveFreak2, emissiveFreak2 * emissiveFreak2BlinkIn, _EmissiveFreak2BlinkInMix);
    #else
        float3 emissiveFreak1 = float3(0,0,0);
        float3 emissiveFreak2 = float3(0,0,0);
    #endif

    #ifdef ARKTOON_EMISSIVE_WAVES
        float time = _Time.b * 0.5;

        // 1st
        float4 _EmissiveWaves1Tex_var4 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1Tex, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TexUV], _EmissiveWaves1Tex)).rgba;
        float3 _EmissiveWaves1Tex_var = _EmissiveWaves1Tex_var4.rgb * _EmissiveWaves1Color.rgb * _EmissiveWaves1Tex_var4.a;

        // Tint
        if (_UseEmissiveWaves1Tint) {
            float3 _EmissiveWaves1TintAFOMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TintAFOMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TintAFOMaskUV], _EmissiveWaves1TintAFOMask)).rgb;
            // 適用度
            float emissiveWaves1TintAmount_var = _EmissiveWaves1TintAmount * _EmissiveWaves1TintAFOMask_var.r;
            if (emissiveWaves1TintAmount_var > 0.0) {
                // 周波数
                float emissiveWaves1TintFreq_var = _EmissiveWaves1TintFreq * _EmissiveWaves1TintAFOMask_var.g;
                // マップの参照位置
                float emissiveWaves1TintPos = 0.0;
                // 0除算避け
                if (emissiveWaves1TintFreq_var != 0.0) {
                    float emissiveWaves1TintOffset_var = (1.0 / emissiveWaves1TintFreq_var) * _EmissiveWaves1TintOffset * _EmissiveWaves1TintAFOMask_var.b;
                    emissiveWaves1TintPos = fmod(emissiveWaves1TintFreq_var * (time + emissiveWaves1TintOffset_var), 1.0);
                } else {
                    emissiveWaves1TintPos = _EmissiveWaves1TintOffset * _EmissiveWaves1TintAFOMask_var.b;
                }
                // タイプによる場合分け
                float3 _EmissiveWaves1TintMapA_var = UNITY_SAMPLE_TEX2D(_EmissiveWaves1TintMapA, float2(emissiveWaves1TintPos,0)).rgb;
                float3 _EmissiveWaves1TintMapB_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TintMapB, _EmissiveWaves1TintMapA, float2(emissiveWaves1TintPos,0)).rgb;
                float3 _EmissiveWaves1TintMapC_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TintMapC, _EmissiveWaves1TintMapA, float2(emissiveWaves1TintPos,0)).rgb;
                int emissiveWaves1TintType = _EmissiveWaves1UseTintTypeMap ?
                                             floatToInt(UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TintTypeMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TintTypeMapUV], _EmissiveWaves1TintTypeMap)).r, 3):
                                             _EmissiveWaves1TintType;
                float3 _EmissiveWaves1TintMap_var = float3(0,0,0);
                float3 emissiveWaves1TintColor = float3(0,0,0);
                switch (emissiveWaves1TintType) {
                    case 0:
                        emissiveWaves1TintColor = _EmissiveWaves1TintColorA * _EmissiveWaves1TintMapA_var;
                        break;
                    case 1:
                        emissiveWaves1TintColor = _EmissiveWaves1TintColorB * _EmissiveWaves1TintMapB_var;
                        break;
                    case 2:
                        emissiveWaves1TintColor = _EmissiveWaves1TintColorC * _EmissiveWaves1TintMapC_var;
                        break;
                }
                _EmissiveWaves1Tex_var = lerp(_EmissiveWaves1Tex_var, tintHDR(_EmissiveWaves1Tex_var, emissiveWaves1TintColor), emissiveWaves1TintAmount_var);
            }
        }

        // Hue Shift
        float _EmissiveWaves1HueShiftMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1HueShiftMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1HueShiftMaskUV], _EmissiveWaves1HueShiftMask)).r;
        float emissiveWaves1Hue = (_EmissiveWaves1HueShift * _EmissiveWaves1HueShiftMask_var * time) % 1.0;

        _EmissiveWaves1Tex_var = CalculateHSV(_EmissiveWaves1Tex_var, emissiveWaves1Hue, 1.0, 1.0);

        // Trace
        float emissiveWaves1Trace = 0.0;
        if(_UseEmissiveWaves1Trace) {
            float3 _EmissiveWaves1TraceAFOMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceAFOMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceAFOMaskUV], _EmissiveWaves1TraceAFOMask)).rgb;
            float3 _EmissiveWaves1TraceMap_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceMapUV], _EmissiveWaves1TraceMap)).rgb;
            float3 _EmissiveWaves1TraceInWSBMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceInWSBMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceInWSBMaskUV], _EmissiveWaves1TraceInWSBMask)).rgb;
            float3 _EmissiveWaves1TraceOutWSBMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceOutWSBMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceOutWSBMaskUV], _EmissiveWaves1TraceOutWSBMask)).rgb;
            float3 _EmissiveWaves1TraceUnisonFDOMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceUnisonFDOMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceUnisonFDOMaskUV], _EmissiveWaves1TraceUnisonFDOMask)).rgb;

            // トレースのフェードの割合
            float traceInOutRatio = _EmissiveWaves1UseTraceInOutRatioMap ?
                                    UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceInOutRatioMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceInOutRatioMapUV], _EmissiveWaves1TraceInOutRatioMap)).r:
                                    _EmissiveWaves1TraceInOutRatio;
            float traceOutRatio = traceInOutRatio > 0.5 ? (1.0 - traceInOutRatio) * 2.0 : 1.0;
            float traceInRatio = traceInOutRatio < 0.5 ? traceInOutRatio * 2.0 : 1.0;

            // サブマップ用に二回回す
            float h1Length = _EmissiveWaves1UseSecond ? 2 : 1;
            [loop]
            for (int h1 = 0; h1 < h1Length; h1++) {
                // 現在処理中のトレースマップ
                float currentEmissiveWaves1TraceMap_var = _EmissiveWaves1TraceMap_var.r;
                float currentEmissiveWaves1Trace = 0.0;
                // サブマップの時
                if (h1 == 1) {
                    currentEmissiveWaves1TraceMap_var = _EmissiveWaves1TraceMap_var.g;
                }
                // 0は計算しない
                if (_EmissiveWaves1TraceMap_var.b > 0.0) {
                    // バイアスにスムースを使うかどうかの真偽
                    float emissiveWaves1TraceInSmooth_bool = _EmissiveWaves1UseTraceInSmoothMap ?
                                                             UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceInSmoothMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceInSmoothMapUV], _EmissiveWaves1TraceInSmoothMap)).r :
                                                             _EmissiveWaves1TraceInSmooth;
                    float emissiveWaves1TraceOutSmooth_bool = _EmissiveWaves1UseTraceOutSmoothMap ?
                                                              UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceOutSmoothMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceOutSmoothMapUV], _EmissiveWaves1TraceOutSmoothMap)).r :
                                                              _EmissiveWaves1TraceOutSmooth;
                    // ユニゾン数分の処理
                    int emissiveWaves1TraceUnisonCount = _EmissiveWaves1UseTraceUnisonMap ?
                                                         floatToInt(UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1TraceUnisonMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1TraceUnisonMapUV], _EmissiveWaves1TraceUnisonMap)).r, 5) + 1:
                                                         _EmissiveWaves1TraceUnison;
                    [loop]
                    for (int h1i1 = 0; h1i1 < emissiveWaves1TraceUnisonCount; h1i1++) {
                        // 周波数
                        float emissiveWaves1TraceFreq_var = _EmissiveWaves1TraceFreq * _EmissiveWaves1TraceAFOMask_var.g;
                        // 0除算避け
                        if (emissiveWaves1TraceFreq_var == 0.0) {
                            emissiveWaves1Trace = 1.0;
                            break;
                        }
                        // オフセット
                        float emissiveWaves1TraceOffset_var = (1.0 / emissiveWaves1TraceFreq_var) * _EmissiveWaves1TraceOffset * _EmissiveWaves1TraceAFOMask_var.b;
                        // 加算波の場合乗算
                        if (h1i1 > 0) {
                            emissiveWaves1TraceFreq_var *= pow(_EmissiveWaves1TraceUnisonFreqMulti * _EmissiveWaves1TraceUnisonFDOMask_var.r, h1i1);  
                        }
                        // 閾値
                        float emissiveWaves1TraceThreshold = fmod(
                            (time + emissiveWaves1TraceOffset_var) * emissiveWaves1TraceFreq_var - _EmissiveWaves1TraceUnisonOffset * _EmissiveWaves1TraceUnisonFDOMask_var.b * float(h1i1), 1.0);
                        // 現在の閾値をトレースタイプによって計算
                        float emissiveWaves1TraceAffect = fmod(emissiveWaves1TraceThreshold - currentEmissiveWaves1TraceMap_var + 1.0, 1.0) * traceInRatio
                                                        + fmod(emissiveWaves1TraceThreshold - currentEmissiveWaves1TraceMap_var - 1.0, 1.0) * traceOutRatio;
                        // ソフトネスによる減衰
                        if (emissiveWaves1TraceAffect < 0.0) {
                            // 反転
                            emissiveWaves1TraceAffect = -emissiveWaves1TraceAffect;
                            // トレース幅による減衰
                            float emissiveWaves1TraceInWidth_var = traceOutRatio * _EmissiveWaves1TraceInWidth * _EmissiveWaves1TraceInWSBMask_var.r;
                            emissiveWaves1TraceAffect = emissiveWaves1TraceAffect <= emissiveWaves1TraceInWidth_var ?
                                                        max(linearstep(emissiveWaves1TraceInWidth_var, 0.0, emissiveWaves1TraceAffect), 0.0) :
                                                        0.0;
                            emissiveWaves1TraceAffect = linearstep(0.0, _EmissiveWaves1TraceInSoftness * _EmissiveWaves1TraceInWSBMask_var.g, emissiveWaves1TraceAffect);
                            // バイアス
                            float fixedEmissiveWaves1TraceInBias = clamp(_EmissiveWaves1TraceInBias * _EmissiveWaves1TraceInWSBMask_var.b, 0.001, 0.999);
                            emissiveWaves1TraceAffect = emissiveWaves1TraceInSmooth_bool ?
                                                        gain(emissiveWaves1TraceAffect, fixedEmissiveWaves1TraceInBias) :
                                                        bias(emissiveWaves1TraceAffect, fixedEmissiveWaves1TraceInBias);
                        } else {
                            // トレース幅による減衰
                            float emissiveWaves1TraceOutWidth_var = traceInRatio * _EmissiveWaves1TraceOutWidth * _EmissiveWaves1TraceOutWSBMask_var.r;
                            emissiveWaves1TraceAffect = emissiveWaves1TraceAffect <= emissiveWaves1TraceOutWidth_var ?
                                          max(linearstep(emissiveWaves1TraceOutWidth_var, 0.0, emissiveWaves1TraceAffect), 0.0) :
                                          0.0;
                            emissiveWaves1TraceAffect = linearstep(0.0, _EmissiveWaves1TraceOutSoftness * _EmissiveWaves1TraceOutWSBMask_var.g, emissiveWaves1TraceAffect);
                            // バイアス
                            float fixedEmissiveWaves1TraceOutBias = clamp(_EmissiveWaves1TraceOutBias * _EmissiveWaves1TraceOutWSBMask_var.b, 0.001, 0.999);
                            emissiveWaves1TraceAffect = emissiveWaves1TraceOutSmooth_bool ?
                                                        gain(emissiveWaves1TraceAffect, fixedEmissiveWaves1TraceOutBias) :
                                                        bias(emissiveWaves1TraceAffect, fixedEmissiveWaves1TraceOutBias);
                                
                        }
                        // 加算波の場合減衰
                        if (h1i1 > 0) {
                            emissiveWaves1TraceAffect *= pow((1.0 - _EmissiveWaves1TraceUnisonDecay * _EmissiveWaves1TraceUnisonFDOMask_var.g), h1i1);
                        }
                        // ユニゾンを考慮して明るいところを取得
                        currentEmissiveWaves1Trace = max(currentEmissiveWaves1Trace, emissiveWaves1TraceAffect);
                    }
                    // サブマップを考慮して明るいところを取得
                    emissiveWaves1Trace = max(emissiveWaves1Trace, currentEmissiveWaves1Trace);
                } else {
                    emissiveWaves1Trace = 1.0;
                }
            }
            // 適用度を計算
            float _EmissiveWaves1TraceAmount_var = 1.0 - _EmissiveWaves1TraceAmount * _EmissiveWaves1TraceAFOMask_var.r;
            emissiveWaves1Trace = emissiveWaves1Trace * (1.0 - _EmissiveWaves1TraceAmount_var) + _EmissiveWaves1TraceAmount_var;
        } else {
            emissiveWaves1Trace = 1.0;
        }

        // Blink
        float emissiveWaves1Blink = 0.0;
        if(_UseEmissiveWaves1Blink) {
            float _EmissiveWaves1BlinkPowerMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkPowerMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkPowerMaskUV], _EmissiveWaves1BlinkPowerMask)).r;
            float3 _EmissiveWaves1BlinkAFOMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkAFOMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkAFOMaskUV], _EmissiveWaves1BlinkAFOMask)).rgb;
            float3 _EmissiveWaves1BlinkUnisonFDOMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkUnisonFDOMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkUnisonFDOMaskUV], _EmissiveWaves1BlinkUnisonFDOMask)).rgb;

            // 波の形状
            int emissiveWaves1BlinkType_var = _EmissiveWaves1UseBlinkTypeMap ?
                                              floatToInt(UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkTypeMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkTypeMapUV], _EmissiveWaves1BlinkTypeMap)).r, 5) :
                                              _EmissiveWaves1BlinkType;
            // 適用度
            float emissiveWaves1BlinkAmount_var = _EmissiveWaves1BlinkAmount * _EmissiveWaves1BlinkAFOMask_var.r;
            if (emissiveWaves1BlinkAmount_var > 0.0) {
                // 上下反転の真偽
                float emissiveWaves1BlinkPowerInvert_bool = _EmissiveWaves1UseBlinkPowerInvertMap ?
                                                            UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkPowerInvertMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkPowerInvertMapUV], _EmissiveWaves1BlinkPowerInvertMap)).r :
                                                            _EmissiveWaves1BlinkPowerInvert;
                // ユニゾンの回数波を合成
                int emissiveWaves1BlinkUnisonCount = _EmissiveWaves1UseBlinkUnisonMap ?
                                                     floatToInt(UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkUnisonMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkUnisonMapUV], _EmissiveWaves1BlinkUnisonMap)).r, 5) + 1:
                                                     _EmissiveWaves1BlinkUnison;
                [loop]
                for (int h2 = 0; h2 < emissiveWaves1BlinkUnisonCount; h2++) {
                    // 波の値
                    float currentEmissiveWaves1BlinkWave = 0.0;
                    // 周波数
                    float currentEmissiveWaves1BlinkFreq = _EmissiveWaves1BlinkFreq * _EmissiveWaves1BlinkAFOMask_var.g;
                    // 0除算避け
                    if (currentEmissiveWaves1BlinkFreq == 0.0) {
                        emissiveWaves1Blink = 1.0;
                        break;
                    }
                    // オフセット
                    float currentEmissiveWaves1BlinkOffset = (1.0 / currentEmissiveWaves1BlinkFreq) * _EmissiveWaves1BlinkOffset * _EmissiveWaves1BlinkAFOMask_var.b;
                    // 加算波の場合周波数とオフセットを変化
                    if (h2 > 0) {
                        currentEmissiveWaves1BlinkFreq *= pow(_EmissiveWaves1BlinkUnisonFreqMulti * _EmissiveWaves1BlinkUnisonFDOMask_var.r, h2);
                        currentEmissiveWaves1BlinkOffset += ((1.0 / currentEmissiveWaves1BlinkFreq) * _EmissiveWaves1BlinkUnisonOffset * _EmissiveWaves1BlinkUnisonFDOMask_var.b) * h2;
                    }
                    // 時間（0.0 ~ 1.0）
                    float currentEmissiveWaves1BlinkTime = fmod(currentEmissiveWaves1BlinkFreq * (time + currentEmissiveWaves1BlinkOffset), 1.0);
                    // 前後反転
                    if (emissiveWaves1BlinkPowerInvert_bool) {
                        currentEmissiveWaves1BlinkTime = 1.0 - currentEmissiveWaves1BlinkTime;    
                    }
                    // 指数的変化をつける
                    currentEmissiveWaves1BlinkTime = pow(currentEmissiveWaves1BlinkTime, _EmissiveWaves1BlinkPower * _EmissiveWaves1BlinkPowerMask_var);
                    // 上下反転
                    if (emissiveWaves1BlinkPowerInvert_bool) {
                        currentEmissiveWaves1BlinkTime = 1.0 - currentEmissiveWaves1BlinkTime;    
                    }
                    // 波の値を取得
                    currentEmissiveWaves1BlinkWave = getWave(emissiveWaves1BlinkType_var, currentEmissiveWaves1BlinkTime, _EmissiveWaves1BlinkCustomWaveMap);
                    // 加算波の場合減衰
                    if (h2 > 0) {
                        currentEmissiveWaves1BlinkWave *= pow((1.0 - _EmissiveWaves1BlinkUnisonDecay * _EmissiveWaves1BlinkUnisonFDOMask_var.g), h2);
                    }
                    // 合成
                    emissiveWaves1Blink += currentEmissiveWaves1BlinkWave;

                }
                // 正規化するか
                float emissiveWaves1BlinkUnisonNormalize_bool = _EmissiveWaves1UseBlinkUnisonNormalizeMap ?
                                                                UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkUnisonNormalizeMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkUnisonNormalizeMapUV], _EmissiveWaves1BlinkUnisonNormalizeMap)).r :
                                                                _EmissiveWaves1BlinkUnisonNormalize;
                if (emissiveWaves1BlinkUnisonNormalize_bool) {
                    // ユニゾンで合成した回数分割って正規化
                    emissiveWaves1Blink /= float(emissiveWaves1BlinkUnisonCount);
                } else {
                    // はみ出た分は切る
                    emissiveWaves1Blink = clamp(emissiveWaves1Blink, -1.0, 1.0);
                }
                // 0.0 ~ 1.0 に補正
                emissiveWaves1Blink = emissiveWaves1Blink * 0.5 + 0.5;
                // 明暗反転
                float emissiveWaves1BlinkInvert_bool = _EmissiveWaves1UseBlinkInvertMap ?
                                                       UNITY_SAMPLE_TEX2D_SAMPLER(_EmissiveWaves1BlinkInvertMap, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_EmissiveWaves1BlinkInvertMapUV], _EmissiveWaves1BlinkInvertMap)).r :
                                                       _EmissiveWaves1BlinkInvert;
                if (emissiveWaves1BlinkInvert_bool) {
                    emissiveWaves1Blink = 1.0 - emissiveWaves1Blink; 
                }
                // 適用度を計算
                emissiveWaves1Blink = emissiveWaves1Blink * emissiveWaves1BlinkAmount_var + (1.0 - emissiveWaves1BlinkAmount_var);
            } else {
                emissiveWaves1Blink = 1.0;
            }
        } else {
            emissiveWaves1Blink = 1.0;
        }

        // ベースとなるテクスチャに乗算する
        float3 emissiveWaves1 = _EmissiveWaves1Tex_var.rgb * emissiveWaves1Trace * emissiveWaves1Blink;        
    #else
        float3 emissiveWaves1 = float3(0,0,0);
    #endif

    // Emissive合成・FinalColor計算
    float4 _EmissionMap_var4 = tex2D(REF_EMISSIONMAP, TRANSFORM_TEX(fixedUV[REF_EMISSIONMAPUV], REF_EMISSIONMAP)).rgba;
    float3 _Emission = _EmissionMap_var4.rgb * REF_EMISSIONCOLOR.rgb * _EmissionMap_var4.a;
    float4 _Emission2Map_var4 = tex2D(REF_EMISSION2MAP, TRANSFORM_TEX(fixedUV[REF_EMISSION2MAPUV], REF_EMISSION2MAP)).rgba;
    float3 _Emission2 = _Emission2Map_var4.rgb * REF_EMISSION2COLOR.rgb * _Emission2Map_var4.a;
    float3 finalEmission = _Emission + _Emission2 + emissionParallax + emissiveFreak1 + emissiveFreak2 + emissiveWaves1;
    float3 emissive = max(lerp(finalEmission.rgb, finalEmission.rgb * i.color, _VertexColorBlendEmissive) , RimLight) * !i.isOutline;
    float3 finalColor = emissive + finalcolor2;

    #ifdef ARKTOON_FADE
        fixed _AlphaMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_AlphaMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_AlphaMaskUV], _AlphaMask)).r;
        #ifdef ARKTOON_REFRACTED
            fixed4 finalRGBA = fixed4(lerp(sceneColor, finalColor, (_MainTex_var.a*REF_COLOR.a*_AlphaMask_var)),1);
        #else
            fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.a*REF_COLOR.a*_AlphaMask_var));
        #endif
    #else
        fixed4 finalRGBA = fixed4(finalColor,1);
    #endif
    UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
    return finalRGBA;
}
