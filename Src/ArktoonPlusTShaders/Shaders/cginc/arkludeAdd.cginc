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

    i.normalDir = normalize(i.normalDir);

    float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir * lerp(1, i.faceSign, _DoubleSidedFlipBackfaceNormal));
    float3 viewDirection = normalize(UnityWorldSpaceViewDir(i.posWorld.xyz));
    float3 _BumpMap_var = UnpackScaleNormal(tex2D(REF_BUMPMAP,TRANSFORM_TEX(fixedUV[REF_BUMPMAPUV], REF_BUMPMAP)), REF_BUMPSCALE);
    float3 normalLocal = _BumpMap_var.rgb;
    float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals

    float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
    float3 lightColor = _LightColor0.rgb;
    float _LightColorSaturationMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_LightColorSaturationMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_LightColorSaturationMaskUV], _LightColorSaturationMask));
    float lightColorSaturation = _LightColorSaturation * _LightColorSaturationMask_var;
    lightColor = CalculateHSV(lightColor,1.0,lightColorSaturation,1.0);
    float3 halfDirection = normalize(viewDirection+lightDirection);
    float3 cameraSpaceViewDir = mul((float3x3)unity_WorldToCamera, viewDirection);
    UNITY_LIGHT_ATTENUATION(attenuation,i, i.posWorld.xyz);
    float4 _MainTex_var = UNITY_SAMPLE_TEX2D(REF_MAINTEX, TRANSFORM_TEX(fixedUV[REF_MAINTEXUV], REF_MAINTEX));
    float3 Diffuse = (_MainTex_var.rgb*REF_COLOR.rgb);
    Diffuse = lerp(Diffuse, Diffuse * i.color,_VertexColorBlendDiffuse); // 頂点カラーを合成

    // アウトラインであればDiffuseとColorを混ぜる
    if (_OutlineUseColorShift) {
        float3 Outline_Diff_HSV = CalculateHSV((Diffuse * _OutlineTextureColorRate + mad(i.col, - _OutlineTextureColorRate,i.col)), _OutlineHueShiftFromBase, _OutlineSaturationFromBase, _OutlineValueFromBase);
        Diffuse = lerp(Diffuse, Outline_Diff_HSV, i.isOutline);
    } else {
        Diffuse = lerp(Diffuse, (Diffuse * _OutlineTextureColorRate + mad(i.col, - _OutlineTextureColorRate,i.col)), i.isOutline);
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

    fixed _PointShadowborderBlur_var = UNITY_SAMPLE_TEX2D_SAMPLER(_PointShadowborderBlurMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_PointShadowborderBlurMaskUV], _PointShadowborderBlurMask)).r * _PointShadowborderBlur;
    float ShadowborderMin = saturate( -_PointShadowborderBlur_var*0.5 +_PointShadowborder);
    float ShadowborderMax = saturate( _PointShadowborderBlur_var * 0.5 + _PointShadowborder);

    float lightContribution = dot(lightDirection, normalDirection)*attenuation;
    float directContribution = 1.0 - ((1.0 - saturate(( (saturate(lightContribution) - ShadowborderMin)) / (ShadowborderMax - ShadowborderMin))));
    // #ifdef USE_POINT_SHADOW_STEPS
        directContribution = lerp(directContribution, saturate(floor(directContribution * _PointShadowSteps) / (_PointShadowSteps - 1)), _PointShadowUseStep);
    // #endif

    // 光の受光に関する更なる補正
    // ・LightIntensityIfBackface(裏面を描画中に変動する受光倍率)
    // ・ShadowCapのModeがLightShutterの時にかかるマスク乗算
    float additionalContributionMultiplier = 1;
    additionalContributionMultiplier *= i.lightIntensityIfBackface;

    if (_ShadowCapBlendMode == 2) { // Light Shutter
        float3 normalDirectionShadowCap = normalize(mul( float3(normalLocal.r*_ShadowCapNormalMix,normalLocal.g*_ShadowCapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
        float2 transformShadowCap = float2(0,0);
        //ここだけ他のComputeTransformCapと式が違った
        if (_UsePositionRelatedCalc) {
            float3 transformShadowCapViewDir = cameraSpaceViewDir  - float3(0,0,1);
            float3 transformShadowCapNormal = mul((float3x3)unity_WorldToCamera, normalDirectionShadowCap);
            float3 transformShadowCapCombined = transformShadowCapViewDir * (dot(transformShadowCapViewDir, transformShadowCapNormal) / transformShadowCapViewDir.z) + transformShadowCapNormal;
            transformShadowCap = ((transformShadowCapCombined.rg*0.5)+0.5);
        } else {
            transformShadowCap = (mul((float3x3)unity_WorldToCamera, normalDirectionShadowCap).rg*0.5+0.5);
        }
        float4 _ShadowCapTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapTexture, REF_MAINTEX, TRANSFORM_TEX(transformShadowCap, _ShadowCapTexture));
        float4 _ShadowCapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowCapBlendMaskUV], _ShadowCapBlendMask));
        additionalContributionMultiplier *= (1.0 - ((1.0 - (_ShadowCapTexture_var.rgb))*_ShadowCapBlendMask_var.rgb)*_ShadowCapBlend);
    }

    directContribution *= additionalContributionMultiplier;
    float _ShadowStrengthMask_var = tex2D(_ShadowStrengthMask, TRANSFORM_TEX(fixedUV[_ShadowStrengthMaskUV], _ShadowStrengthMask));

    float3 finalLight = saturate(directContribution + ((1 - (_PointShadowStrength * _ShadowStrengthMask_var)) * attenuation));

    float3 coloredLight = saturate(lightColor*finalLight*_PointAddIntensity);
    float3 toonedMap = Diffuse * coloredLight;

    float3 specular = float3(0,0,0);
    float3 shadowcap = float3(1000,1000,1000);
    float3 matcap = float3(0,0,0);
    float3 RimLight = float3(0,0,0);

    #if !defined(ARKTOON_REFRACTED)
    if (_UseOutline == 0 || !i.isOutline) {
    #endif
        // オプション：Gloss
        if(_UseGloss) {
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
            float NdotV = abs(dot( normalDirection, viewDirection ));
            float NdotH = saturate(dot( normalDirection, halfDirection ));
            float VdotH = saturate(dot( viewDirection, halfDirection ));
            float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
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

        // オプション:ShadeCap
        if (_ShadowCapBlendMode < 2) {
            float3 normalDirectionShadowCap = normalize(mul( float3(normalLocal.r*_ShadowCapNormalMix,normalLocal.g*_ShadowCapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
            float2 transformShadowCap = ComputeTransformCap(cameraSpaceViewDir,normalDirectionShadowCap);
            float4 _ShadowCapTexture_var =  UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapTexture, REF_MAINTEX, TRANSFORM_TEX(transformShadowCap, _ShadowCapTexture));
            float4 _ShadowCapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowCapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_ShadowCapBlendMaskUV], _ShadowCapBlendMask));
            shadowcap = (1.0 - ((1.0 - (_ShadowCapTexture_var.rgb))*_ShadowCapBlendMask_var.rgb)*_ShadowCapBlend);
        }

        // オプション：MatCap
        if (_MatcapBlendMode < 3) {
            float3 normalDirectionMatcap = normalize(mul( float3(normalLocal.r*_MatcapNormalMix,normalLocal.g*_MatcapNormalMix,normalLocal.b), tangentTransform )); // Perturbed normals
            float2 transformMatcap = ComputeTransformCap(cameraSpaceViewDir,normalDirectionMatcap);
            float4 _MatcapTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_MatcapTexture, REF_MAINTEX, TRANSFORM_TEX(transformMatcap, _MatcapTexture));
            float4 _MatcapBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_MatcapBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_MatcapBlendMaskUV], _MatcapBlendMask));
            float3 matcapResult = ((_MatcapColor.rgb*_MatcapTexture_var.rgb)*_MatcapBlendMask_var.rgb*_MatcapBlend);
            matcap = min(matcapResult, matcapResult * (coloredLight * _MatcapShadeMix));
        }

        // オプション：Rim
        if (_UseRim) {
            float _RimBlendMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_RimBlendMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_RimBlendMaskUV], _RimBlendMask));
            float4 _RimTexture_var = UNITY_SAMPLE_TEX2D_SAMPLER(_RimTexture, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_RimTextureUV], _RimTexture));
            RimLight = (
                lerp( _RimTexture_var.rgb, Diffuse, _RimUseBaseTexture )
                * pow(
                    saturate(1.0 - saturate(dot(normalDirection, viewDirection)) + _RimUpperSideWidth)
                    , _RimFresnelPower
                )
                * _RimBlend
                * _RimColor.rgb
                * _RimBlendMask_var
            );
            RimLight = min(RimLight, RimLight * (coloredLight * _RimShadeMix));
        }
    #if !defined(ARKTOON_REFRACTED)
    }
    #endif

    float3 finalColor = max(toonedMap, RimLight) + specular;

    // ShadeCapのブレンドモード
    if (_ShadowCapBlendMode == 0) { // Darken
        finalColor = min(finalColor, shadowcap);
    } else if  (_ShadowCapBlendMode == 1) { // Multiply
        finalColor = finalColor * shadowcap;
    }

    // MatCapのブレンドモード
    if (_MatcapBlendMode == 0) { // Add
        finalColor = finalColor + matcap;
    } else if (_MatcapBlendMode == 1) { // Lighten
        finalColor = max(finalColor, matcap);
    } else if (_MatcapBlendMode == 2) { // Screen
        finalColor = 1-(1-finalColor) * (1-matcap);
    }

    #ifdef ARKTOON_FADE
        fixed _AlphaMask_var = UNITY_SAMPLE_TEX2D_SAMPLER(_AlphaMask, REF_MAINTEX, TRANSFORM_TEX(fixedUV[_AlphaMaskUV], _AlphaMask)).r;
        fixed4 finalRGBA = fixed4(finalColor * (_MainTex_var.a * REF_COLOR.a * _AlphaMask_var),0);
    #else
        fixed4 finalRGBA = fixed4(finalColor * 1,0);
    #endif
    UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
    return finalRGBA;
}