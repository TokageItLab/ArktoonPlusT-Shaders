// Arktoon+T-Shaders
// Copyright (c) 2020-2021 Tokage IT Lab.
// Copyright (c) 2018 synqark
// This code is released under the MIT License.
// http://opensource.org/licenses/mit-license.php

using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System;

namespace ArktoonPlusTShaders
{
    public class ArktoonInspector : ShaderGUI
    {
        #region MaterialProperties
        MaterialProperty UseTransformUV;
        MaterialProperty UseTransformUVScroll;
        MaterialProperty TransformUVScrollMap;
        MaterialProperty TransformUVScrollSpeedMap;
        MaterialProperty TransformUVScrollSpeed;
        MaterialProperty UseTransformUVRotate;
        MaterialProperty TransformUVRotateMap;
        MaterialProperty TransformUVRotateSpeedMap;
        MaterialProperty TransformUVRotateSpeed;

        MaterialProperty UseTransformUV2;
        MaterialProperty UseTransformUV2Scroll;
        MaterialProperty TransformUV2ScrollMap;
        MaterialProperty TransformUV2ScrollSpeedMap;
        MaterialProperty TransformUV2ScrollSpeed;
        MaterialProperty UseTransformUV2Rotate;
        MaterialProperty TransformUV2RotateMap;
        MaterialProperty TransformUV2RotateSpeedMap;
        MaterialProperty TransformUV2RotateSpeed;

        MaterialProperty BaseTexture;
        MaterialProperty BaseTextureUV;
        MaterialProperty BaseColor;
        MaterialProperty Normalmap;
        MaterialProperty NormalmapUV;
        MaterialProperty BumpScale;
        MaterialProperty EmissionMap;
        MaterialProperty EmissionMapUV;
        MaterialProperty EmissionColor;
        MaterialProperty Emission2Map;
        MaterialProperty Emission2MapUV;
        MaterialProperty Emission2Color;
        MaterialProperty AlphaMask;
        MaterialProperty AlphaMaskUV;
        MaterialProperty BaseTextureSecondary;
        MaterialProperty BaseTextureUVSecondary;
        MaterialProperty BaseColorSecondary;
        MaterialProperty NormalmapSecondary;
        MaterialProperty NormalmapUVSecondary;
        MaterialProperty BumpScaleSecondary;
        MaterialProperty EmissionMapSecondary;
        MaterialProperty EmissionMapUVSecondary;
        MaterialProperty EmissionColorSecondary;
        MaterialProperty Emission2MapSecondary;
        MaterialProperty Emission2MapUVSecondary;
        MaterialProperty Emission2ColorSecondary;
        MaterialProperty UseEmissionParallax;
        MaterialProperty EmissionParallaxColor;
        MaterialProperty EmissionParallaxTex;
        MaterialProperty EmissionParallaxTexUV;
        MaterialProperty EmissionParallaxMask;
        MaterialProperty EmissionParallaxMaskUV;
        MaterialProperty EmissionParallaxDepth;
        MaterialProperty EmissionParallaxDepthMask;
        MaterialProperty EmissionParallaxDepthMaskUV;
        MaterialProperty EmissionParallaxDepthMaskInvert;
        MaterialProperty LightColorSaturation;
        MaterialProperty LightColorSaturationMask;
        MaterialProperty LightColorSaturationMaskUV;
        MaterialProperty Shadowborder;
        MaterialProperty ShadowborderBlur;
        MaterialProperty ShadowborderBlurMask;
        MaterialProperty ShadowborderBlurMaskUV;
        MaterialProperty ShadowStrength;
        MaterialProperty ShadowStrengthMask;
        MaterialProperty ShadowStrengthMaskUV;
        MaterialProperty ShadowIndirectIntensity;
        MaterialProperty ShadowUseStep;
        MaterialProperty ShadowSteps;
        MaterialProperty PointAddIntensity;
        MaterialProperty PointShadowStrength;
        MaterialProperty PointShadowborder;
        MaterialProperty PointShadowborderBlur;
        MaterialProperty PointShadowborderBlurMask;
        MaterialProperty PointShadowborderBlurMaskUV;
        MaterialProperty PointShadowUseStep;
        MaterialProperty PointShadowSteps;
        MaterialProperty CutoutCutoutAdjust;
        MaterialProperty ShadowPlanBUsePlanB;
        MaterialProperty ShadowPlanBDefaultShadowMix;
        MaterialProperty ShadowPlanBUseCustomShadowTexture;
        MaterialProperty ShadowPlanBHueShiftFromBase;
        MaterialProperty ShadowPlanBSaturationFromBase;
        MaterialProperty ShadowPlanBValueFromBase;
        MaterialProperty ShadowPlanBCustomShadowTexture;
        MaterialProperty ShadowPlanBCustomShadowTextureUV;
        MaterialProperty ShadowPlanBCustomShadowTextureRGB;
        MaterialProperty CustomShadow2nd;
        MaterialProperty ShadowPlanB2border;
        MaterialProperty ShadowPlanB2borderBlur;
        MaterialProperty ShadowPlanB2HueShiftFromBase;
        MaterialProperty ShadowPlanB2SaturationFromBase;
        MaterialProperty ShadowPlanB2ValueFromBase;
        MaterialProperty ShadowPlanB2UseCustomShadowTexture;
        MaterialProperty ShadowPlanB2CustomShadowTexture;
        MaterialProperty ShadowPlanB2CustomShadowTextureUV;
        MaterialProperty ShadowPlanB2CustomShadowTextureRGB;
        MaterialProperty UseGloss;
        MaterialProperty GlossColor;
        MaterialProperty GlossTexture;
        MaterialProperty GlossTextureUV;
        MaterialProperty GlossBlend;
        MaterialProperty GlossBlendMask;
        MaterialProperty GlossBlendMaskUV;
        MaterialProperty GlossPower;
        MaterialProperty GlossPowerMask;
        MaterialProperty GlossPowerMaskUV;
        MaterialProperty UseOutline;
        MaterialProperty OutlineWidth;
        MaterialProperty OutlineMask;
        MaterialProperty OutlineMaskUV;
        MaterialProperty OutlineCutoffRange;
        MaterialProperty OutlineColor;
        MaterialProperty OutlineTexture;
        MaterialProperty OutlineTextureUV;
        MaterialProperty OutlineShadeMix;
        MaterialProperty OutlineTextureColorRate;
        MaterialProperty OutlineWidthMask;
        MaterialProperty OutlineWidthMaskUV;
        MaterialProperty OutlineUseColorShift;
        MaterialProperty OutlineHueShiftFromBase;
        MaterialProperty OutlineSaturationFromBase;
        MaterialProperty OutlineValueFromBase;
        MaterialProperty MatcapBlendMode;
        MaterialProperty MatcapBlend;
        MaterialProperty MatcapTexture;
        MaterialProperty MatcapTextureUV;
        MaterialProperty MatcapColor;
        MaterialProperty MatcapBlendMask;
        MaterialProperty MatcapBlendMaskUV;
        MaterialProperty MatcapNormalMix;
        MaterialProperty MatcapShadeMix;
        MaterialProperty UseReflection;
        MaterialProperty UseReflectionProbe;
        MaterialProperty ReflectionColor;
        MaterialProperty ReflectionTexture;
        MaterialProperty ReflectionTextureUV;
        MaterialProperty ReflectionReflectionPower;
        MaterialProperty ReflectionReflectionMask;
        MaterialProperty ReflectionReflectionMaskUV;
        MaterialProperty ReflectionNormalMix;
        MaterialProperty ReflectionShadeMix;
        MaterialProperty ReflectionCubemap;
        MaterialProperty ReflectionSuppressBaseColorValue;
        MaterialProperty RefractionFresnelExp;
        MaterialProperty RefractionStrength;
        MaterialProperty UseRim;
        MaterialProperty RimBlend;
        MaterialProperty RimBlendMask;
        MaterialProperty RimBlendMaskUV;
        MaterialProperty RimShadeMix;
        MaterialProperty RimFresnelPower;
        MaterialProperty RimUpperSideWidth;
        MaterialProperty RimColor;
        MaterialProperty RimTexture;
        MaterialProperty RimTextureUV;
        MaterialProperty RimUseBaseTexture;
        MaterialProperty ShadowCapBlendMode;
        MaterialProperty ShadowCapBlend;
        MaterialProperty ShadowCapBlendMask;
        MaterialProperty ShadowCapBlendMaskUV;
        MaterialProperty ShadowCapNormalMix;
        MaterialProperty ShadowCapTexture;
        MaterialProperty ShadowCapTextureUV;
        MaterialProperty StencilNumber;
        MaterialProperty StencilCompareAction;
        MaterialProperty StencilNumberSecondary;
        MaterialProperty StencilCompareActionSecondary;
        MaterialProperty StencilMaskTex;
        MaterialProperty StencilMaskTexUV;
        MaterialProperty StencilMaskAdjust;
        MaterialProperty StencilMaskAlphaDither;
        MaterialProperty UseDoubleSided;
        MaterialProperty DoubleSidedFlipBackfaceNormal;
        MaterialProperty DoubleSidedBackfaceLightIntensity;
        MaterialProperty DoubleSidedBackfaceUseColorShift;
        MaterialProperty DoubleSidedBackfaceHueShiftFromBase;
        MaterialProperty DoubleSidedBackfaceSaturationFromBase;
        MaterialProperty DoubleSidedBackfaceValueFromBase;
        MaterialProperty ShadowCasterCulling;
        MaterialProperty ZWrite;
        MaterialProperty VertexColorBlendDiffuse;
        MaterialProperty VertexColorBlendEmissive;
        MaterialProperty OtherShadowBorderSharpness;
        MaterialProperty OtherShadowAdjust;
        MaterialProperty UseVertexLight;
        MaterialProperty BackfaceColorMultiply;
        MaterialProperty LightSampling;
        MaterialProperty UsePositionRelatedCalc;
        MaterialProperty EmissiveFreak1Tex;
        MaterialProperty EmissiveFreak1TexUV;
        MaterialProperty EmissiveFreak1Mask;
        MaterialProperty EmissiveFreak1MaskUV;
        MaterialProperty EmissiveFreak1Color;
        MaterialProperty EmissiveFreak1U;
        MaterialProperty EmissiveFreak1V;
        MaterialProperty EmissiveFreak1Depth;
        MaterialProperty EmissiveFreak1DepthMask;
        MaterialProperty EmissiveFreak1DepthMaskUV;
        MaterialProperty EmissiveFreak1DepthMaskInvert;
        MaterialProperty EmissiveFreak1Breathing;
        MaterialProperty EmissiveFreak1BreathingMix;
        MaterialProperty EmissiveFreak1BlinkOut;
        MaterialProperty EmissiveFreak1BlinkOutMix;
        MaterialProperty EmissiveFreak1BlinkIn;
        MaterialProperty EmissiveFreak1BlinkInMix;
        MaterialProperty EmissiveFreak1HueShift;
        MaterialProperty EmissiveFreak2Tex;
        MaterialProperty EmissiveFreak2TexUV;
        MaterialProperty EmissiveFreak2Mask;
        MaterialProperty EmissiveFreak2MaskUV;
        MaterialProperty EmissiveFreak2Color;
        MaterialProperty EmissiveFreak2U;
        MaterialProperty EmissiveFreak2V;
        MaterialProperty EmissiveFreak2Depth;
        MaterialProperty EmissiveFreak2DepthMask;
        MaterialProperty EmissiveFreak2DepthMaskUV;
        MaterialProperty EmissiveFreak2DepthMaskInvert;
        MaterialProperty EmissiveFreak2Breathing;
        MaterialProperty EmissiveFreak2BreathingMix;
        MaterialProperty EmissiveFreak2BlinkOut;
        MaterialProperty EmissiveFreak2BlinkOutMix;
        MaterialProperty EmissiveFreak2BlinkIn;
        MaterialProperty EmissiveFreak2BlinkInMix;
        MaterialProperty EmissiveFreak2HueShift;

        MaterialProperty EmissiveWaves1Tex;
        MaterialProperty EmissiveWaves1TexUV;
        MaterialProperty EmissiveWaves1Color;

        MaterialProperty UseEmissiveWaves1Trace;
        MaterialProperty EmissiveWaves1TraceMap;
        MaterialProperty EmissiveWaves1TraceMapUV;
        MaterialProperty EmissiveWaves1UseSecond;
        MaterialProperty EmissiveWaves1TraceAmount;
        MaterialProperty EmissiveWaves1TraceFreq;
        MaterialProperty EmissiveWaves1TraceOffset;
        MaterialProperty EmissiveWaves1TraceAFOMask;
        MaterialProperty EmissiveWaves1TraceAFOMaskUV;
        MaterialProperty EmissiveWaves1TraceInOutRatio;
        MaterialProperty EmissiveWaves1UseTraceInOutRatioMap;
        MaterialProperty EmissiveWaves1TraceInOutRatioMap;
        MaterialProperty EmissiveWaves1TraceInOutRatioMapUV;
        MaterialProperty EmissiveWaves1TraceInSmooth;
        MaterialProperty EmissiveWaves1UseTraceInSmoothMap;
        MaterialProperty EmissiveWaves1TraceInSmoothMap;
        MaterialProperty EmissiveWaves1TraceInSmoothMapUV;
        MaterialProperty EmissiveWaves1TraceInWidth;
        MaterialProperty EmissiveWaves1TraceInSoftness;
        MaterialProperty EmissiveWaves1TraceInBias;
        MaterialProperty EmissiveWaves1TraceInWSBMask;
        MaterialProperty EmissiveWaves1TraceInWSBMaskUV;
        MaterialProperty EmissiveWaves1TraceOutSmooth;
        MaterialProperty EmissiveWaves1UseTraceOutSmoothMap;
        MaterialProperty EmissiveWaves1TraceOutSmoothMap;
        MaterialProperty EmissiveWaves1TraceOutSmoothMapUV;
        MaterialProperty EmissiveWaves1TraceOutWidth;
        MaterialProperty EmissiveWaves1TraceOutSoftness;
        MaterialProperty EmissiveWaves1TraceOutBias;
        MaterialProperty EmissiveWaves1TraceOutWSBMask;
        MaterialProperty EmissiveWaves1TraceOutWSBMaskUV;
        MaterialProperty EmissiveWaves1TraceUnison;
        MaterialProperty EmissiveWaves1UseTraceUnisonMap;
        MaterialProperty EmissiveWaves1TraceUnisonMap;
        MaterialProperty EmissiveWaves1TraceUnisonMapUV;
        MaterialProperty EmissiveWaves1TraceUnisonFreqMulti;
        MaterialProperty EmissiveWaves1TraceUnisonDecay;
        MaterialProperty EmissiveWaves1TraceUnisonOffset;
        MaterialProperty EmissiveWaves1TraceUnisonFDOMask;
        MaterialProperty EmissiveWaves1TraceUnisonFDOMaskUV;

        MaterialProperty UseEmissiveWaves1Blink;
        MaterialProperty EmissiveWaves1BlinkType;
        MaterialProperty EmissiveWaves1UseBlinkTypeMap;
        MaterialProperty EmissiveWaves1BlinkTypeMap;
        MaterialProperty EmissiveWaves1BlinkTypeMapUV;
        MaterialProperty EmissiveWaves1BlinkCustomWaveMap;
        MaterialProperty EmissiveWaves1BlinkInvert;
        MaterialProperty EmissiveWaves1UseBlinkInvertMap;
        MaterialProperty EmissiveWaves1BlinkInvertMap;
        MaterialProperty EmissiveWaves1BlinkInvertMapUV;
        MaterialProperty EmissiveWaves1BlinkPower;
        MaterialProperty EmissiveWaves1BlinkPowerMask;
        MaterialProperty EmissiveWaves1BlinkPowerMaskUV;
        MaterialProperty EmissiveWaves1BlinkPowerInvert;
        MaterialProperty EmissiveWaves1UseBlinkPowerInvertMap;
        MaterialProperty EmissiveWaves1BlinkPowerInvertMap;
        MaterialProperty EmissiveWaves1BlinkPowerInvertMapUV;
        MaterialProperty EmissiveWaves1BlinkAmount;
        MaterialProperty EmissiveWaves1BlinkFreq;
        MaterialProperty EmissiveWaves1BlinkOffset;
        MaterialProperty EmissiveWaves1BlinkAFOMask;
        MaterialProperty EmissiveWaves1BlinkAFOMaskUV;
        MaterialProperty EmissiveWaves1BlinkUnison;
        MaterialProperty EmissiveWaves1UseBlinkUnisonMap;
        MaterialProperty EmissiveWaves1BlinkUnisonMap;
        MaterialProperty EmissiveWaves1BlinkUnisonMapUV;
        MaterialProperty EmissiveWaves1BlinkUnisonFreqMulti;
        MaterialProperty EmissiveWaves1BlinkUnisonDecay;
        MaterialProperty EmissiveWaves1BlinkUnisonOffset;
        MaterialProperty EmissiveWaves1BlinkUnisonFDOMask;
        MaterialProperty EmissiveWaves1BlinkUnisonFDOMaskUV;
        MaterialProperty EmissiveWaves1BlinkUnisonNormalize;
        MaterialProperty EmissiveWaves1UseBlinkUnisonNormalizeMap;
        MaterialProperty EmissiveWaves1BlinkUnisonNormalizeMap;
        MaterialProperty EmissiveWaves1BlinkUnisonNormalizeMapUV;

        MaterialProperty UseEmissiveWaves1Tint;
        MaterialProperty EmissiveWaves1TintMapA;
        MaterialProperty EmissiveWaves1TintColorA;
        MaterialProperty EmissiveWaves1TintMapB;
        MaterialProperty EmissiveWaves1TintColorB;
        MaterialProperty EmissiveWaves1TintMapC;
        MaterialProperty EmissiveWaves1TintColorC;
        MaterialProperty EmissiveWaves1TintType;
        MaterialProperty EmissiveWaves1UseTintTypeMap;
        MaterialProperty EmissiveWaves1TintTypeMap;
        MaterialProperty EmissiveWaves1TintTypeMapUV;
        MaterialProperty EmissiveWaves1TintAmount;
        MaterialProperty EmissiveWaves1TintFreq;
        MaterialProperty EmissiveWaves1TintOffset;
        MaterialProperty EmissiveWaves1TintAFOMask;
        MaterialProperty EmissiveWaves1TintAFOMaskUV;

        MaterialProperty EmissiveWaves1HueShift;
        MaterialProperty EmissiveWaves1HueShiftMask;
        MaterialProperty EmissiveWaves1HueShiftMaskUV;

        // TODO: そろそろShaderUtil.GetPropertiesで一括処理したい。
        // ただ、その場合は、カスタムインスペクタで定義していない追加のプロパティを、このファイルを弄らずに動的に表示できるようにしてあげたい（改変の負荷軽減のため）

        #endregion

        static bool IsShowAdvanced = false;
        static bool IsShowAlphaMask = false;
        GUIStyle style = new GUIStyle();


        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
        {
            Material material = materialEditor.target as Material;

            /*
            // バージョンを逐一確認して、アセットバージョンが高い場合はマテリアルをマイグレーション
            if( material.GetInt("_Version") < ArktoonManager.AssetVersionInt) {
                ArktoonMigrator.MigrateArktoonMaterial(material);
            }
            */

            Shader shader = material.shader;

            // shader.nameによって調整可能なプロパティを制御する。
            bool isOpaque = shader.name.Contains("Opaque");
            bool isFade = shader.name.Contains("Fade");
            bool isCutout = shader.name.Contains("Cutout");
            bool isStencilWriter = shader.name.Contains("Stencil/Writer") || shader.name.Contains("StencilWriter");
            bool isStencilReader = shader.name.Contains("Stencil/Reader") || shader.name.Contains("StencilReader");
            bool isStencilReaderDouble = shader.name.Contains("Stencil/Reader/Double");
            bool isStencilWriterMask = shader.name.Contains("Stencil/WriterMask");
            bool isRefracted = shader.name.Contains("Refracted");
            bool isEmissiveFreak = shader.name.Contains("/EmissiveFreak/");
            bool isEmissiveWaves = shader.name.Contains("/EmissiveWaves/");

            // FindProperties
            UseTransformUV = FindProperty("_UseTransformUV", props, false);
            UseTransformUVScroll = FindProperty("_UseTransformUVScroll", props, false);
            TransformUVScrollMap = FindProperty("_TransformUVScrollMap", props, false);
            TransformUVScrollSpeedMap = FindProperty("_TransformUVScrollSpeedMap", props, false);
            TransformUVScrollSpeed = FindProperty("_TransformUVScrollSpeed", props, false);
            UseTransformUVRotate = FindProperty("_UseTransformUVRotate", props, false);
            TransformUVRotateMap = FindProperty("_TransformUVRotateMap", props, false);
            TransformUVRotateSpeedMap = FindProperty("_TransformUVRotateSpeedMap", props, false);
            TransformUVRotateSpeed = FindProperty("_TransformUVRotateSpeed", props, false);

            UseTransformUV2 = FindProperty("_UseTransformUV2", props, false);
            UseTransformUV2Scroll = FindProperty("_UseTransformUV2Scroll", props, false);
            TransformUV2ScrollMap = FindProperty("_TransformUV2ScrollMap", props, false);
            TransformUV2ScrollSpeedMap = FindProperty("_TransformUV2ScrollSpeedMap", props, false);
            TransformUV2ScrollSpeed = FindProperty("_TransformUV2ScrollSpeed", props, false);
            UseTransformUV2Rotate = FindProperty("_UseTransformUV2Rotate", props, false);
            TransformUV2RotateMap = FindProperty("_TransformUV2RotateMap", props, false);
            TransformUV2RotateSpeedMap = FindProperty("_TransformUV2RotateSpeedMap", props, false);
            TransformUV2RotateSpeed = FindProperty("_TransformUV2RotateSpeed", props, false);

            BaseTexture = FindProperty("_MainTex", props, false);
            BaseTextureUV = FindProperty("_MainTexUV", props, false);
            BaseColor = FindProperty("_Color", props, false);
            Normalmap = FindProperty("_BumpMap", props, false);
            NormalmapUV = FindProperty("_BumpMapUV", props, false);
            BumpScale = FindProperty("_BumpScale", props, false);
            EmissionMap = FindProperty("_EmissionMap", props, false);
            EmissionMapUV = FindProperty("_EmissionMapUV", props, false);
            EmissionColor = FindProperty("_EmissionColor", props, false);
            Emission2Map = FindProperty("_Emission2Map", props, false);
            Emission2MapUV = FindProperty("_Emission2MapUV", props, false);
            Emission2Color = FindProperty("_Emission2Color", props, false);
            LightColorSaturation = FindProperty("_LightColorSaturation", props, false);
            LightColorSaturationMask = FindProperty("_LightColorSaturationMask", props, false);
            LightColorSaturationMaskUV = FindProperty("_LightColorSaturationMaskUV", props, false);
            AlphaMask = FindProperty("_AlphaMask", props, false);
            AlphaMaskUV = FindProperty("_AlphaMaskUV", props, false);
            BaseTextureSecondary = FindProperty("_MainTexSecondary", props, false);
            BaseTextureUVSecondary = FindProperty("_MainTexUVSecondary", props, false);
            BaseColorSecondary = FindProperty("_ColorSecondary", props, false);
            NormalmapSecondary = FindProperty("_BumpMapSecondary", props, false);
            NormalmapUVSecondary = FindProperty("_BumpMapUVSecondary", props, false);
            BumpScaleSecondary = FindProperty("_BumpScaleSecondary", props, false);
            EmissionMapSecondary = FindProperty("_EmissionMapSecondary", props, false);
            EmissionMapUVSecondary = FindProperty("_EmissionMapUVSecondary", props, false);
            EmissionColorSecondary = FindProperty("_EmissionColorSecondary", props, false);
            Emission2MapSecondary = FindProperty("_Emission2MapSecondary", props, false);
            Emission2MapUVSecondary = FindProperty("_Emission2MapUVSecondary", props, false);
            Emission2ColorSecondary = FindProperty("_Emission2ColorSecondary", props, false);
            UseEmissionParallax = FindProperty("_UseEmissionParallax", props, false);
            EmissionParallaxColor = FindProperty("_EmissionParallaxColor", props, false);
            EmissionParallaxTex = FindProperty("_EmissionParallaxTex", props, false);
            EmissionParallaxTexUV = FindProperty("_EmissionParallaxTexUV", props, false);
            EmissionParallaxMask = FindProperty("_EmissionParallaxMask", props, false);
            EmissionParallaxMaskUV = FindProperty("_EmissionParallaxMaskUV", props, false);
            EmissionParallaxDepth = FindProperty("_EmissionParallaxDepth", props, false);
            EmissionParallaxDepthMask = FindProperty("_EmissionParallaxDepthMask", props, false);
            EmissionParallaxDepthMaskUV = FindProperty("_EmissionParallaxDepthMaskUV", props, false);
            EmissionParallaxDepthMaskInvert = FindProperty("_EmissionParallaxDepthMaskInvert", props, false);
            CutoutCutoutAdjust = FindProperty("_CutoutCutoutAdjust", props, false);
            Shadowborder = FindProperty("_Shadowborder", props, false);
            ShadowborderBlur = FindProperty("_ShadowborderBlur", props, false);
            ShadowborderBlurMask = FindProperty("_ShadowborderBlurMask", props, false);
            ShadowborderBlurMaskUV = FindProperty("_ShadowborderBlurMaskUV", props, false);
            ShadowStrength = FindProperty("_ShadowStrength", props, false);
            ShadowStrengthMask = FindProperty("_ShadowStrengthMask", props, false);
            ShadowStrengthMaskUV = FindProperty("_ShadowStrengthMaskUV", props, false);
            ShadowIndirectIntensity = FindProperty("_ShadowIndirectIntensity", props, false);
            ShadowUseStep = FindProperty("_ShadowUseStep", props, false);
            ShadowSteps = FindProperty("_ShadowSteps", props, false);
            PointAddIntensity = FindProperty("_PointAddIntensity", props, false);
            PointShadowStrength = FindProperty("_PointShadowStrength", props, false);
            PointShadowborder = FindProperty("_PointShadowborder", props, false);
            PointShadowborderBlur = FindProperty("_PointShadowborderBlur", props, false);
            PointShadowborderBlurMask= FindProperty("_PointShadowborderBlurMask", props, false);
            PointShadowborderBlurMaskUV = FindProperty("_PointShadowborderBlurMaskUV", props, false);
            PointShadowUseStep = FindProperty("_PointShadowUseStep", props, false);
            PointShadowSteps = FindProperty("_PointShadowSteps", props, false);
            ShadowPlanBUsePlanB = FindProperty("_ShadowPlanBUsePlanB", props, false);
            ShadowPlanBDefaultShadowMix = FindProperty("_ShadowPlanBDefaultShadowMix", props, false);
            ShadowPlanBUseCustomShadowTexture = FindProperty("_ShadowPlanBUseCustomShadowTexture", props, false);
            ShadowPlanBHueShiftFromBase = FindProperty("_ShadowPlanBHueShiftFromBase", props, false);
            ShadowPlanBSaturationFromBase = FindProperty("_ShadowPlanBSaturationFromBase", props, false);
            ShadowPlanBValueFromBase = FindProperty("_ShadowPlanBValueFromBase", props, false);
            ShadowPlanBCustomShadowTexture = FindProperty("_ShadowPlanBCustomShadowTexture", props, false);
            ShadowPlanBCustomShadowTextureUV = FindProperty("_ShadowPlanBCustomShadowTextureUV", props, false);
            ShadowPlanBCustomShadowTextureRGB = FindProperty("_ShadowPlanBCustomShadowTextureRGB", props, false);
            CustomShadow2nd = FindProperty("_CustomShadow2nd", props, false);
            ShadowPlanB2border = FindProperty("_ShadowPlanB2border", props, false);
            ShadowPlanB2borderBlur = FindProperty("_ShadowPlanB2borderBlur", props, false);
            ShadowPlanB2HueShiftFromBase = FindProperty("_ShadowPlanB2HueShiftFromBase", props, false);
            ShadowPlanB2SaturationFromBase = FindProperty("_ShadowPlanB2SaturationFromBase", props, false);
            ShadowPlanB2ValueFromBase = FindProperty("_ShadowPlanB2ValueFromBase", props, false);
            ShadowPlanB2UseCustomShadowTexture = FindProperty("_ShadowPlanB2UseCustomShadowTexture", props, false);
            ShadowPlanB2CustomShadowTexture = FindProperty("_ShadowPlanB2CustomShadowTexture", props, false);
            ShadowPlanB2CustomShadowTextureUV = FindProperty("_ShadowPlanB2CustomShadowTextureUV", props, false);
            ShadowPlanB2CustomShadowTextureRGB = FindProperty("_ShadowPlanB2CustomShadowTextureRGB", props, false);
            UseGloss = FindProperty("_UseGloss", props, false);
            GlossColor = FindProperty("_GlossColor", props, false);
            GlossTexture = FindProperty("_GlossTexture", props, false);
            GlossTextureUV = FindProperty("_GlossTextureUV", props, false);
            GlossBlend = FindProperty("_GlossBlend", props, false);
            GlossBlendMask = FindProperty("_GlossBlendMask", props, false);
            GlossBlendMaskUV = FindProperty("_GlossBlendMaskUV", props, false);
            GlossPower = FindProperty("_GlossPower", props, false);
            GlossPowerMask = FindProperty("_GlossPowerMask", props, false);
            GlossPowerMaskUV = FindProperty("_GlossPowerMaskUV", props, false);
            UseOutline = FindProperty("_UseOutline", props, false);
            OutlineWidth = FindProperty("_OutlineWidth", props, false);
            OutlineMask = FindProperty("_OutlineMask", props, false);
            OutlineMaskUV = FindProperty("_OutlineMaskUV", props, false);
            OutlineCutoffRange = FindProperty("_OutlineCutoffRange", props, false);
            OutlineColor = FindProperty("_OutlineColor", props, false);
            OutlineTexture = FindProperty("_OutlineTexture", props, false);
            OutlineTextureUV = FindProperty("_OutlineTextureUV", props, false);
            OutlineShadeMix = FindProperty("_OutlineShadeMix", props, false);
            OutlineTextureColorRate = FindProperty("_OutlineTextureColorRate", props, false);
            OutlineWidthMask = FindProperty("_OutlineWidthMask", props, false);
            OutlineWidthMaskUV = FindProperty("_OutlineWidthMaskUV", props, false);
            OutlineUseColorShift = FindProperty("_OutlineUseColorShift", props, false);
            OutlineHueShiftFromBase = FindProperty("_OutlineHueShiftFromBase", props, false);
            OutlineSaturationFromBase = FindProperty("_OutlineSaturationFromBase", props, false);
            OutlineValueFromBase = FindProperty("_OutlineValueFromBase", props, false);
            MatcapBlendMode = FindProperty("_MatcapBlendMode", props, false);
            MatcapBlend = FindProperty("_MatcapBlend", props, false);
            MatcapTexture = FindProperty("_MatcapTexture", props, false);
            MatcapTextureUV = FindProperty("_MatcapTextureUV", props, false);
            MatcapColor = FindProperty("_MatcapColor", props, false);
            MatcapBlendMask = FindProperty("_MatcapBlendMask", props, false);
            MatcapBlendMaskUV = FindProperty("_MatcapBlendMaskUV", props, false);
            MatcapNormalMix = FindProperty("_MatcapNormalMix", props, false);
            MatcapShadeMix = FindProperty("_MatcapShadeMix", props, false);
            UseReflection = FindProperty("_UseReflection", props, false);
            UseReflectionProbe = FindProperty("_UseReflectionProbe", props, false);
            ReflectionColor = FindProperty("_ReflectionColor", props, false);
            ReflectionTexture = FindProperty("_ReflectionTexture", props, false);
            ReflectionTextureUV = FindProperty("_ReflectionTextureUV", props, false);
            ReflectionReflectionPower = FindProperty("_ReflectionReflectionPower", props, false);
            ReflectionReflectionMask = FindProperty("_ReflectionReflectionMask", props, false);
            ReflectionReflectionMaskUV = FindProperty("_ReflectionReflectionMaskUV", props, false);
            ReflectionNormalMix = FindProperty("_ReflectionNormalMix", props, false);
            ReflectionShadeMix = FindProperty("_ReflectionShadeMix", props, false);
            ReflectionCubemap = FindProperty("_ReflectionCubemap", props, false);
            ReflectionSuppressBaseColorValue = FindProperty("_ReflectionSuppressBaseColorValue", props, false);
            RefractionFresnelExp = FindProperty("_RefractionFresnelExp", props, false);
            RefractionStrength = FindProperty("_RefractionStrength", props, false);
            UseRim = FindProperty("_UseRim", props, false);
            RimBlend = FindProperty("_RimBlend", props, false);
            RimBlendMask = FindProperty("_RimBlendMask", props, false);
            RimBlendMaskUV = FindProperty("_RimBlendMaskUV", props, false);
            RimShadeMix = FindProperty("_RimShadeMix", props, false);
            RimFresnelPower = FindProperty("_RimFresnelPower", props, false);
            RimUpperSideWidth = FindProperty("_RimUpperSideWidth", props, false);
            RimColor = FindProperty("_RimColor", props, false);
            RimTexture = FindProperty("_RimTexture", props, false);
            RimTextureUV = FindProperty("_RimTextureUV", props, false);
            RimUseBaseTexture = FindProperty("_RimUseBaseTexture", props, false);
            ShadowCapBlendMode = FindProperty("_ShadowCapBlendMode", props, false);
            ShadowCapBlend = FindProperty("_ShadowCapBlend", props, false);
            ShadowCapBlendMask = FindProperty("_ShadowCapBlendMask", props, false);
            ShadowCapBlendMaskUV = FindProperty("_ShadowCapBlendMaskUV", props, false);
            ShadowCapNormalMix = FindProperty("_ShadowCapNormalMix", props, false);
            ShadowCapTexture = FindProperty("_ShadowCapTexture", props, false);
            ShadowCapTextureUV = FindProperty("_ShadowCapTextureUV", props, false);
            StencilNumber = FindProperty("_StencilNumber", props, false);
            StencilMaskTex = FindProperty("_StencilMaskTex", props, false);
            StencilMaskTexUV = FindProperty("_StencilMaskTexUV", props, false);
            StencilMaskAdjust = FindProperty("_StencilMaskAdjust", props, false);
            StencilMaskAlphaDither = FindProperty("_StencilMaskAlphaDither", props, false);
            StencilCompareAction = FindProperty("_StencilCompareAction", props, false);
            StencilNumberSecondary = FindProperty("_StencilNumberSecondary", props, false);
            StencilCompareActionSecondary = FindProperty("_StencilCompareActionSecondary", props, false);
            UseDoubleSided = FindProperty("_UseDoubleSided", props, false);
            DoubleSidedFlipBackfaceNormal = FindProperty("_DoubleSidedFlipBackfaceNormal", props, false);
            DoubleSidedBackfaceLightIntensity = FindProperty("_DoubleSidedBackfaceLightIntensity", props, false);
            DoubleSidedBackfaceUseColorShift = FindProperty("_DoubleSidedBackfaceUseColorShift", props, false);
            DoubleSidedBackfaceHueShiftFromBase = FindProperty("_DoubleSidedBackfaceHueShiftFromBase", props, false);
            DoubleSidedBackfaceSaturationFromBase = FindProperty("_DoubleSidedBackfaceSaturationFromBase", props, false);
            DoubleSidedBackfaceValueFromBase = FindProperty("_DoubleSidedBackfaceValueFromBase", props, false);
            ShadowCasterCulling = FindProperty("_ShadowCasterCulling", props, false);
            VertexColorBlendDiffuse = FindProperty("_VertexColorBlendDiffuse", props, false);
            VertexColorBlendEmissive = FindProperty("_VertexColorBlendEmissive", props, false);
            OtherShadowBorderSharpness = FindProperty("_OtherShadowBorderSharpness", props, false);
            OtherShadowAdjust = FindProperty("_OtherShadowAdjust", props, false);
            UseVertexLight = FindProperty("_UseVertexLight", props, false);
            LightSampling = FindProperty("_LightSampling", props, false);
            UsePositionRelatedCalc = FindProperty("_UsePositionRelatedCalc", props, false);
            ZWrite = FindProperty("_ZWrite", props, false);

            EmissiveFreak1Tex = FindProperty("_EmissiveFreak1Tex", props, false);
            EmissiveFreak1TexUV = FindProperty("_EmissiveFreak1TexUV", props, false);
            EmissiveFreak1Mask = FindProperty("_EmissiveFreak1Mask", props, false);
            EmissiveFreak1MaskUV = FindProperty("_EmissiveFreak1MaskUV", props, false);
            EmissiveFreak1Color = FindProperty("_EmissiveFreak1Color", props, false);
            EmissiveFreak1U = FindProperty("_EmissiveFreak1U", props, false);
            EmissiveFreak1V = FindProperty("_EmissiveFreak1V", props, false);
            EmissiveFreak1Depth = FindProperty("_EmissiveFreak1Depth", props, false);
            EmissiveFreak1DepthMask = FindProperty("_EmissiveFreak1DepthMask", props, false);
            EmissiveFreak1DepthMaskUV = FindProperty("_EmissiveFreak1DepthMaskUV", props, false);
            EmissiveFreak1DepthMaskInvert = FindProperty("_EmissiveFreak1DepthMaskInvert", props, false);
            EmissiveFreak1Breathing = FindProperty("_EmissiveFreak1Breathing", props, false);
            EmissiveFreak1BreathingMix = FindProperty("_EmissiveFreak1BreathingMix", props, false);
            EmissiveFreak1BlinkOut = FindProperty("_EmissiveFreak1BlinkOut", props, false);
            EmissiveFreak1BlinkOutMix = FindProperty("_EmissiveFreak1BlinkOutMix", props, false);
            EmissiveFreak1BlinkIn = FindProperty("_EmissiveFreak1BlinkIn", props, false);
            EmissiveFreak1BlinkInMix = FindProperty("_EmissiveFreak1BlinkInMix", props, false);
            EmissiveFreak1HueShift = FindProperty("_EmissiveFreak1HueShift", props, false);

            EmissiveFreak2Tex = FindProperty("_EmissiveFreak2Tex", props, false);
            EmissiveFreak2TexUV = FindProperty("_EmissiveFreak2TexUV", props, false);
            EmissiveFreak2Mask = FindProperty("_EmissiveFreak2Mask", props, false);
            EmissiveFreak2MaskUV = FindProperty("_EmissiveFreak2MaskUV", props, false);
            EmissiveFreak2Color = FindProperty("_EmissiveFreak2Color", props, false);
            EmissiveFreak2U = FindProperty("_EmissiveFreak2U", props, false);
            EmissiveFreak2V = FindProperty("_EmissiveFreak2V", props, false);
            EmissiveFreak2Depth = FindProperty("_EmissiveFreak2Depth", props, false);
            EmissiveFreak2DepthMask = FindProperty("_EmissiveFreak2DepthMask", props, false);
            EmissiveFreak2DepthMaskUV = FindProperty("_EmissiveFreak2DepthMaskUV", props, false);
            EmissiveFreak2DepthMaskInvert = FindProperty("_EmissiveFreak2DepthMaskInvert", props, false);
            EmissiveFreak2Breathing = FindProperty("_EmissiveFreak2Breathing", props, false);
            EmissiveFreak2BreathingMix = FindProperty("_EmissiveFreak2BreathingMix", props, false);
            EmissiveFreak2BlinkOut = FindProperty("_EmissiveFreak2BlinkOut", props, false);
            EmissiveFreak2BlinkOutMix = FindProperty("_EmissiveFreak2BlinkOutMix", props, false);
            EmissiveFreak2BlinkIn = FindProperty("_EmissiveFreak2BlinkIn", props, false);
            EmissiveFreak2BlinkInMix = FindProperty("_EmissiveFreak2BlinkInMix", props, false);
            EmissiveFreak2HueShift = FindProperty("_EmissiveFreak2HueShift", props, false);

            EmissiveWaves1Tex = FindProperty("_EmissiveWaves1Tex", props, false);
            EmissiveWaves1TexUV = FindProperty("_EmissiveWaves1TexUV", props, false);
            EmissiveWaves1Color = FindProperty("_EmissiveWaves1Color", props, false);

            UseEmissiveWaves1Trace = FindProperty("_UseEmissiveWaves1Trace", props, false);
            EmissiveWaves1TraceMap = FindProperty("_EmissiveWaves1TraceMap", props, false);
            EmissiveWaves1TraceMapUV = FindProperty("_EmissiveWaves1TraceMapUV", props, false);
            EmissiveWaves1UseSecond = FindProperty("_EmissiveWaves1UseSecond", props, false);
            EmissiveWaves1TraceAmount = FindProperty("_EmissiveWaves1TraceAmount", props, false);
            EmissiveWaves1TraceFreq = FindProperty("_EmissiveWaves1TraceFreq", props, false);
            EmissiveWaves1TraceOffset = FindProperty("_EmissiveWaves1TraceOffset", props, false);
            EmissiveWaves1TraceAFOMask = FindProperty("_EmissiveWaves1TraceAFOMask", props, false);
            EmissiveWaves1TraceAFOMaskUV = FindProperty("_EmissiveWaves1TraceAFOMaskUV", props, false);
            EmissiveWaves1TraceInOutRatio = FindProperty("_EmissiveWaves1TraceInOutRatio", props, false);
            EmissiveWaves1UseTraceInOutRatioMap = FindProperty("_EmissiveWaves1UseTraceInOutRatioMap", props, false);
            EmissiveWaves1TraceInOutRatioMap = FindProperty("_EmissiveWaves1TraceInOutRatioMap", props, false);
            EmissiveWaves1TraceInOutRatioMapUV = FindProperty("_EmissiveWaves1TraceInOutRatioMapUV", props, false);
            EmissiveWaves1TraceInSmooth = FindProperty("_EmissiveWaves1TraceInSmooth", props, false);
            EmissiveWaves1UseTraceInSmoothMap = FindProperty("_EmissiveWaves1UseTraceInSmoothMap", props, false);
            EmissiveWaves1TraceInSmoothMap = FindProperty("_EmissiveWaves1TraceInSmoothMap", props, false);
            EmissiveWaves1TraceInSmoothMapUV = FindProperty("_EmissiveWaves1TraceInSmoothMapUV", props, false);
            EmissiveWaves1TraceInWidth = FindProperty("_EmissiveWaves1TraceInWidth", props, false);
            EmissiveWaves1TraceInSoftness = FindProperty("_EmissiveWaves1TraceInSoftness", props, false);
            EmissiveWaves1TraceInBias = FindProperty("_EmissiveWaves1TraceInBias", props, false);
            EmissiveWaves1TraceInWSBMask = FindProperty("_EmissiveWaves1TraceInWSBMask", props, false);
            EmissiveWaves1TraceInWSBMaskUV = FindProperty("_EmissiveWaves1TraceInWSBMaskUV", props, false);
            EmissiveWaves1TraceOutSmooth = FindProperty("_EmissiveWaves1TraceOutSmooth", props, false);
            EmissiveWaves1UseTraceOutSmoothMap = FindProperty("_EmissiveWaves1UseTraceOutSmoothMap", props, false);
            EmissiveWaves1TraceOutSmoothMap = FindProperty("_EmissiveWaves1TraceOutSmoothMap", props, false);
            EmissiveWaves1TraceOutSmoothMapUV = FindProperty("_EmissiveWaves1TraceOutSmoothMapUV", props, false);
            EmissiveWaves1TraceOutWidth = FindProperty("_EmissiveWaves1TraceOutWidth", props, false);
            EmissiveWaves1TraceOutSoftness = FindProperty("_EmissiveWaves1TraceOutSoftness", props, false);
            EmissiveWaves1TraceOutBias = FindProperty("_EmissiveWaves1TraceOutBias", props, false);
            EmissiveWaves1TraceOutWSBMask = FindProperty("_EmissiveWaves1TraceOutWSBMask", props, false);
            EmissiveWaves1TraceOutWSBMaskUV = FindProperty("_EmissiveWaves1TraceOutWSBMaskUV", props, false);
            EmissiveWaves1TraceUnison = FindProperty("_EmissiveWaves1TraceUnison", props, false);
            EmissiveWaves1UseTraceUnisonMap = FindProperty("_EmissiveWaves1UseTraceUnisonMap", props, false);
            EmissiveWaves1TraceUnisonMap = FindProperty("_EmissiveWaves1TraceUnisonMap", props, false);
            EmissiveWaves1TraceUnisonMapUV = FindProperty("_EmissiveWaves1TraceUnisonMapUV", props, false);
            EmissiveWaves1TraceUnisonFreqMulti = FindProperty("_EmissiveWaves1TraceUnisonFreqMulti", props, false);
            EmissiveWaves1TraceUnisonDecay = FindProperty("_EmissiveWaves1TraceUnisonDecay", props, false);
            EmissiveWaves1TraceUnisonOffset = FindProperty("_EmissiveWaves1TraceUnisonOffset", props, false);
            EmissiveWaves1TraceUnisonFDOMask = FindProperty("_EmissiveWaves1TraceUnisonFDOMask", props, false);
            EmissiveWaves1TraceUnisonFDOMaskUV = FindProperty("_EmissiveWaves1TraceUnisonFDOMaskUV", props, false);

            UseEmissiveWaves1Blink = FindProperty("_UseEmissiveWaves1Blink", props, false);
            EmissiveWaves1BlinkType = FindProperty("_EmissiveWaves1BlinkType", props, false);
            EmissiveWaves1UseBlinkTypeMap = FindProperty("_EmissiveWaves1UseBlinkTypeMap", props, false);
            EmissiveWaves1BlinkTypeMap = FindProperty("_EmissiveWaves1BlinkTypeMap", props, false);
            EmissiveWaves1BlinkTypeMapUV = FindProperty("_EmissiveWaves1BlinkTypeMapUV", props, false);
            EmissiveWaves1BlinkCustomWaveMap = FindProperty("_EmissiveWaves1BlinkCustomWaveMap", props, false);
            EmissiveWaves1BlinkInvert = FindProperty("_EmissiveWaves1BlinkInvert", props, false);
            EmissiveWaves1UseBlinkInvertMap = FindProperty("_EmissiveWaves1UseBlinkInvertMap", props, false);
            EmissiveWaves1BlinkInvertMap = FindProperty("_EmissiveWaves1BlinkInvertMap", props, false);
            EmissiveWaves1BlinkInvertMapUV = FindProperty("_EmissiveWaves1BlinkInvertMapUV", props, false);
            EmissiveWaves1BlinkPower = FindProperty("_EmissiveWaves1BlinkPower", props, false);
            EmissiveWaves1BlinkPowerMask = FindProperty("_EmissiveWaves1BlinkPowerMask", props, false);
            EmissiveWaves1BlinkPowerMaskUV = FindProperty("_EmissiveWaves1BlinkPowerMaskUV", props, false);
            EmissiveWaves1BlinkPowerInvert = FindProperty("_EmissiveWaves1BlinkPowerInvert", props, false);
            EmissiveWaves1UseBlinkPowerInvertMap = FindProperty("_EmissiveWaves1UseBlinkPowerInvertMap", props, false);
            EmissiveWaves1BlinkPowerInvertMap = FindProperty("_EmissiveWaves1BlinkPowerInvertMap", props, false);
            EmissiveWaves1BlinkPowerInvertMapUV = FindProperty("_EmissiveWaves1BlinkPowerInvertMapUV", props, false);
            EmissiveWaves1BlinkAmount = FindProperty("_EmissiveWaves1BlinkAmount", props, false);
            EmissiveWaves1BlinkFreq = FindProperty("_EmissiveWaves1BlinkFreq", props, false);
            EmissiveWaves1BlinkOffset = FindProperty("_EmissiveWaves1BlinkOffset", props, false);
            EmissiveWaves1BlinkAFOMask = FindProperty("_EmissiveWaves1BlinkAFOMask", props, false);
            EmissiveWaves1BlinkAFOMaskUV = FindProperty("_EmissiveWaves1BlinkAFOMaskUV", props, false);
            EmissiveWaves1BlinkUnison = FindProperty("_EmissiveWaves1BlinkUnison", props, false);
            EmissiveWaves1UseBlinkUnisonMap = FindProperty("_EmissiveWaves1UseBlinkUnisonMap", props, false);
            EmissiveWaves1BlinkUnisonMap = FindProperty("_EmissiveWaves1BlinkUnisonMap", props, false);
            EmissiveWaves1BlinkUnisonMapUV = FindProperty("_EmissiveWaves1BlinkUnisonMapUV", props, false);
            EmissiveWaves1BlinkUnisonFreqMulti = FindProperty("_EmissiveWaves1BlinkUnisonFreqMulti", props, false);
            EmissiveWaves1BlinkUnisonDecay = FindProperty("_EmissiveWaves1BlinkUnisonDecay", props, false);
            EmissiveWaves1BlinkUnisonOffset = FindProperty("_EmissiveWaves1BlinkUnisonOffset", props, false);
            EmissiveWaves1BlinkUnisonFDOMask = FindProperty("_EmissiveWaves1BlinkUnisonFDOMask", props, false);
            EmissiveWaves1BlinkUnisonFDOMaskUV = FindProperty("_EmissiveWaves1BlinkUnisonFDOMaskUV", props, false);
            EmissiveWaves1BlinkUnisonNormalize = FindProperty("_EmissiveWaves1BlinkUnisonNormalize", props, false);
            EmissiveWaves1UseBlinkUnisonNormalizeMap = FindProperty("_EmissiveWaves1UseBlinkUnisonNormalizeMap", props, false);
            EmissiveWaves1BlinkUnisonNormalizeMap = FindProperty("_EmissiveWaves1BlinkUnisonNormalizeMap", props, false);
            EmissiveWaves1BlinkUnisonNormalizeMapUV = FindProperty("_EmissiveWaves1BlinkUnisonNormalizeMapUV", props, false);

            UseEmissiveWaves1Tint = FindProperty("_UseEmissiveWaves1Tint", props, false);
            EmissiveWaves1TintMapA = FindProperty("_EmissiveWaves1TintMapA", props, false);
            EmissiveWaves1TintColorA = FindProperty("_EmissiveWaves1TintColorA", props, false);
            EmissiveWaves1TintMapB = FindProperty("_EmissiveWaves1TintMapB", props, false);
            EmissiveWaves1TintColorB = FindProperty("_EmissiveWaves1TintColorB", props, false);
            EmissiveWaves1TintMapC = FindProperty("_EmissiveWaves1TintMapC", props, false);
            EmissiveWaves1TintColorC = FindProperty("_EmissiveWaves1TintColorC", props, false);
            EmissiveWaves1TintType = FindProperty("_EmissiveWaves1TintType", props, false);
            EmissiveWaves1UseTintTypeMap = FindProperty("_EmissiveWaves1UseTintTypeMap", props, false);
            EmissiveWaves1TintTypeMap = FindProperty("_EmissiveWaves1TintTypeMap", props, false);
            EmissiveWaves1TintTypeMapUV = FindProperty("_EmissiveWaves1TintTypeMapUV", props, false);
            EmissiveWaves1TintAmount = FindProperty("_EmissiveWaves1TintAmount", props, false);
            EmissiveWaves1TintFreq = FindProperty("_EmissiveWaves1TintFreq", props, false);
            EmissiveWaves1TintOffset = FindProperty("_EmissiveWaves1TintOffset", props, false);
            EmissiveWaves1TintAFOMask = FindProperty("_EmissiveWaves1TintAFOMask", props, false);
            EmissiveWaves1TintAFOMaskUV = FindProperty("_EmissiveWaves1TintAFOMaskUV", props, false);

            EmissiveWaves1HueShift = FindProperty("_EmissiveWaves1HueShift", props, false);
            EmissiveWaves1HueShiftMask = FindProperty("_EmissiveWaves1HueShiftMask", props, false);
            EmissiveWaves1HueShiftMaskUV = FindProperty("_EmissiveWaves1HueShiftMaskUV", props, false);

            EditorGUIUtility.labelWidth = 0f;

            EditorGUI.BeginChangeCheck();
            {
                // TransformUV
                UIHelper.ShurikenHeader("UV Transform");
                UIHelper.DrawWithGroup(() => {
                    EditorGUILayout.LabelField("Channel1", EditorStyles.boldLabel);
                    materialEditor.ShaderProperty(UseTransformUV, "Use Transform");
                    if (UseTransformUV.floatValue > 0)
                    {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(UseTransformUVScroll, "Use Scroll");
                            if (UseTransformUVScroll.floatValue > 0)
                            {
                                materialEditor.ShaderProperty(TransformUVScrollMap, "Scroll Map");
                                materialEditor.ShaderProperty(TransformUVScrollSpeedMap, "Scroll Speed Map");
                                materialEditor.ShaderProperty(TransformUVScrollSpeed, "Scroll Speed");
                            }
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(UseTransformUVRotate, "Use Rotate");
                            if (UseTransformUVRotate.floatValue > 0)
                            {
                                materialEditor.ShaderProperty(TransformUVRotateMap, "Rotate Map");
                                materialEditor.ShaderProperty(TransformUVRotateSpeedMap, "Rotate Speed Map");
                                materialEditor.ShaderProperty(TransformUVRotateSpeed, "Rotate Speed");
                            }
                        });
                    }
                });
                UIHelper.DrawWithGroup(() => {
                    EditorGUILayout.LabelField("Channel2", EditorStyles.boldLabel);
                    materialEditor.ShaderProperty(UseTransformUV2, "Use Transform");
                    if (UseTransformUV2.floatValue > 0)
                    {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(UseTransformUV2Scroll, "Use Scroll");
                            if (UseTransformUV2Scroll.floatValue > 0)
                            {
                                materialEditor.ShaderProperty(TransformUV2ScrollMap, "Scroll Map");
                                materialEditor.ShaderProperty(TransformUV2ScrollSpeedMap, "Scroll Speed Map");
                                materialEditor.ShaderProperty(TransformUV2ScrollSpeed, "Scroll Speed");
                            }
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(UseTransformUV2Rotate, "Use Rotate");
                            if (UseTransformUV2Rotate.floatValue > 0)
                            {
                                materialEditor.ShaderProperty(TransformUV2RotateMap, "Rotate Map");
                                materialEditor.ShaderProperty(TransformUV2RotateSpeedMap, "Rotate Speed Map");
                                materialEditor.ShaderProperty(TransformUV2RotateSpeed, "Rotate Speed");
                            }
                        });
                    }
                });
                // Common
                UIHelper.ShurikenHeader("Common");
                UIHelper.DrawWithGroup(() => {
					UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Main Texture", "Base Color Texture (RGB)"), BaseTexture, BaseColor);
                        materialEditor.TextureScaleOffsetPropertyIndent(BaseTexture);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(BaseTextureUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Normal Map", "Normal Map (RGB)"), Normalmap, BumpScale);
                        materialEditor.TextureScaleOffsetPropertyIndent(Normalmap);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(NormalmapUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Emission", "Emission (RGB)"), EmissionMap, EmissionColor);
                        materialEditor.TextureScaleOffsetPropertyIndent(EmissionMap);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(EmissionMapUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Emission2", "Emission2 (RGB)"), Emission2Map, Emission2Color);
                        materialEditor.TextureScaleOffsetPropertyIndent(Emission2Map);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(Emission2MapUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });

                    // materialEditor.ShaderProperty(Cull, "Cull");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(UseDoubleSided, "Is Double Sided");
                        var doublesided = UseDoubleSided.floatValue;
                        if(doublesided > 0){
                            ShadowCasterCulling.floatValue = 0;
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(DoubleSidedFlipBackfaceNormal, "Flip backface normal");
                            materialEditor.ShaderProperty(DoubleSidedBackfaceLightIntensity, "Backface Light Intensity");
                            materialEditor.ShaderProperty(DoubleSidedBackfaceUseColorShift, "Use Backface Color Shift");
                            var backfaceColorShift = DoubleSidedBackfaceUseColorShift.floatValue;
                            if(backfaceColorShift > 0) {
                                EditorGUI.indentLevel ++;
                                materialEditor.ShaderProperty(DoubleSidedBackfaceHueShiftFromBase, "Hue Shift");
                                materialEditor.ShaderProperty(DoubleSidedBackfaceSaturationFromBase, "Saturation");
                                materialEditor.ShaderProperty(DoubleSidedBackfaceValueFromBase, "Value");
                                EditorGUI.indentLevel --;
                            }

                            EditorGUI.indentLevel --;
                        } else {
                            ShadowCasterCulling.floatValue = 2;
                        }
                        if(isFade) materialEditor.ShaderProperty(ZWrite, "ZWrite");
                    });

                    // Render Queue
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.RenderQueueField();
                    });
                });

                // Secondary Common
                if(isStencilReaderDouble){
                    UIHelper.ShurikenHeader("Secondary Common");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Main Texture", "Base Color Texture (RGB)"), BaseTextureSecondary, BaseColorSecondary);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(BaseTextureUVSecondary, "UV Channel");
                        EditorGUI.indentLevel--;
                        materialEditor.TexturePropertySingleLine(new GUIContent("Normal Map", "Normal Map (RGB)"), NormalmapSecondary, BumpScaleSecondary);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(NormalmapUVSecondary, "UV Channel");
                        EditorGUI.indentLevel--;
                        materialEditor.TexturePropertySingleLine(new GUIContent("Emission", "Emission (RGB)"), EmissionMapSecondary, EmissionColorSecondary);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(EmissionMapUVSecondary, "UV Channel");
                        EditorGUI.indentLevel--;
                        materialEditor.TexturePropertySingleLine(new GUIContent("Emission2", "Emission2 (RGB)"), Emission2MapSecondary, Emission2ColorSecondary);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(Emission2MapUVSecondary, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                }

                // AlphaMask
                if(isFade){
                    IsShowAlphaMask = UIHelper.ShurikenFoldout("AlphaMask", IsShowAlphaMask);
                    if (IsShowAlphaMask) {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(AlphaMask, "Alpha Mask");
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(AlphaMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                    }
                }

                // Refraction
                if(isRefracted){
                    UIHelper.ShurikenHeader("Refraction");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(RefractionFresnelExp, "Fresnel Exp");
                        materialEditor.ShaderProperty(RefractionStrength, "Strength");
                    });
                }

                // Alpha Cutout
                if(isCutout){
                    UIHelper.ShurikenHeader("Alpha Cutout");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(CutoutCutoutAdjust, "Cutoff Adjust");
                    });
                }

                // Lighting
                UIHelper.ShurikenHeader("Lighting");
                UIHelper.DrawWithGroup(() => {
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Light Color Saturation & Mask", "Light Color Saturation and Mask Texture"), LightColorSaturationMask, LightColorSaturation);
                        materialEditor.TextureScaleOffsetPropertyIndent(LightColorSaturationMask);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(LightColorSaturationMaskUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                });

                // Shadow
                UIHelper.ShurikenHeader("Shadow");
                UIHelper.DrawWithGroup(() => {
                    materialEditor.ShaderProperty(Shadowborder, "Border");

                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Strength & Mask", "Strength and Mask Texture"), ShadowStrengthMask, ShadowStrength);
                        materialEditor.TextureScaleOffsetPropertyIndent(ShadowStrengthMask);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(ShadowStrengthMaskUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });

                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Blur & Mask", "Blur and Mask Texture"), ShadowborderBlurMask, ShadowborderBlur);
                        materialEditor.TextureScaleOffsetPropertyIndent(ShadowborderBlurMask);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(ShadowborderBlurMaskUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });

                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(ShadowUseStep, "Use Steps");
                        var useStep = ShadowUseStep.floatValue;
                        if(useStep > 0)
                        {
                            EditorGUI.indentLevel ++;
                            ShadowSteps.floatValue = EditorGUILayout.IntSlider(
                                new GUIContent("Steps"),
                                (int)ShadowSteps.floatValue,
                                (int)ShadowSteps.rangeLimits.x,
                                (int)ShadowSteps.rangeLimits.y)
                            ;
                            EditorGUI.indentLevel --;
                        }
                    });

                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(ShadowPlanBUsePlanB, "Use Custom Shade");
                        var usePlanB = ShadowPlanBUsePlanB.floatValue;
                        if(usePlanB > 0)
                        {
                            EditorGUILayout.HelpBox(
                                "[Strength] max is recommended for using custom shade." + Environment.NewLine + "Custom Shadeの使用時は[Strength]を最大値に設定することを推奨", MessageType.Info);
                            materialEditor.ShaderProperty(ShadowPlanBDefaultShadowMix, "Mix Default Shade");
                            UIHelper.DrawWithGroup(() => {
                                EditorGUILayout.LabelField("1st shade", EditorStyles.boldLabel);
                                EditorGUI.indentLevel ++;
                                materialEditor.ShaderProperty(ShadowPlanBUseCustomShadowTexture, "Use Shade Texture");
                                var useShadeTexture = ShadowPlanBUseCustomShadowTexture.floatValue;
                                if(useShadeTexture > 0)
                                {
                                    materialEditor.ShaderProperty(ShadowPlanBCustomShadowTexture, "Shade Texture");
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(ShadowPlanBCustomShadowTextureUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                    materialEditor.ShaderProperty(ShadowPlanBCustomShadowTextureRGB, "Shade Texture RGB");
                                }
                                else
                                {
                                    materialEditor.ShaderProperty(ShadowPlanBHueShiftFromBase, "Hue Shift");
                                    materialEditor.ShaderProperty(ShadowPlanBSaturationFromBase, "Saturation");
                                    materialEditor.ShaderProperty(ShadowPlanBValueFromBase, "Value");
                                }
                                EditorGUI.indentLevel --;
                            });

                            UIHelper.DrawWithGroup(() => {
                                EditorGUILayout.LabelField("2nd shade", EditorStyles.boldLabel);
                                EditorGUI.indentLevel ++;
                                materialEditor.ShaderProperty(CustomShadow2nd, "Use");
                                var customshadow2nd = CustomShadow2nd.floatValue;
                                if(customshadow2nd > 0)
                                {
                                    materialEditor.ShaderProperty(ShadowPlanB2border, "Border");
                                    materialEditor.ShaderProperty(ShadowPlanB2borderBlur, "Blur");
                                    materialEditor.ShaderProperty(ShadowPlanB2UseCustomShadowTexture, "Use Shade Texture");
                                    var useShadeTexture2 = ShadowPlanB2UseCustomShadowTexture.floatValue;
                                    if(useShadeTexture2 > 0)
                                    {
                                        materialEditor.ShaderProperty(ShadowPlanB2CustomShadowTexture,  "Shade Texture");
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(ShadowPlanB2CustomShadowTextureUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                        materialEditor.ShaderProperty(ShadowPlanB2CustomShadowTextureRGB,  "Shade Texture RGB");
                                    }else{
                                        materialEditor.ShaderProperty(ShadowPlanB2HueShiftFromBase, "Hue Shift");
                                        materialEditor.ShaderProperty(ShadowPlanB2SaturationFromBase, "Saturation");
                                        materialEditor.ShaderProperty(ShadowPlanB2ValueFromBase, "Value");
                                    }
                                }
                                EditorGUI.indentLevel --;
                            });
                        }
                    });
                });

                // Gloss
                UIHelper.ShurikenHeader("Gloss");
                materialEditor.DrawShaderPropertySameLIne(UseGloss);
                var isEnabledGloss = UseGloss.floatValue;
                if(isEnabledGloss > 0)
                {
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Gloss Color", "Gloss Color Texture (RGB)"), GlossTexture, GlossColor);
                            materialEditor.TextureScaleOffsetPropertyIndent(GlossTexture);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(GlossTextureUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Smoothness & Mask", "Smoothness and Mask Texture"), GlossBlendMask, GlossBlend);
                            materialEditor.TextureScaleOffsetPropertyIndent(GlossBlendMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(GlossBlendMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Metallic & Mask", "Metallic and Mask Texture"), GlossPowerMask, GlossPower);
                            materialEditor.TextureScaleOffsetPropertyIndent(GlossPowerMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(GlossPowerMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                    });
                }

                // Outline
                if(!isRefracted) {
                    UIHelper.ShurikenHeader("Outline");
                    materialEditor.DrawShaderPropertySameLIne(UseOutline);
                    var useOutline = UseOutline.floatValue;
                    if(useOutline > 0)
                    {
                        UIHelper.DrawWithGroup(() => {
                            UIHelper.DrawWithGroup(() => {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Width & Mask", "Width and Mask Texture"), OutlineWidthMask, OutlineWidth);
                                materialEditor.TextureScaleOffsetPropertyIndent(OutlineWidthMask);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(OutlineWidthMaskUV, "UV Channel");
                                EditorGUI.indentLevel--;
                            });
                            UIHelper.DrawWithGroup(() => {
                                if(!isOpaque) {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Cutoff Mask & Range", "Cutoff Mask Texture & Range"), OutlineMask, OutlineCutoffRange);
                                    materialEditor.TextureScaleOffsetPropertyIndent(OutlineMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(OutlineMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                }
                                else{
                                    EditorGUILayout.LabelField("Cutoff Mask & Range","Unavailable in Opaque", EditorStyles.centeredGreyMiniLabel);
                                }
                            });
                            UIHelper.DrawWithGroup(() => {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), OutlineTexture, OutlineColor);
                                materialEditor.TextureScaleOffsetPropertyIndent(OutlineTexture);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(OutlineTextureUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                materialEditor.ShaderProperty(OutlineTextureColorRate,"Base Color Mix");
                                materialEditor.ShaderProperty(OutlineUseColorShift, "Use Color Shift");
                                var isEnabledOutlineColorShift = OutlineUseColorShift.floatValue;
                                if(isEnabledOutlineColorShift > 0) {
                                    EditorGUI.indentLevel ++;
                                    materialEditor.ShaderProperty(OutlineHueShiftFromBase, "Hue Shift");
                                    materialEditor.ShaderProperty(OutlineSaturationFromBase, "Saturation");
                                    materialEditor.ShaderProperty(OutlineValueFromBase, "Value");
                                    EditorGUI.indentLevel --;
                                }
                            });
                            materialEditor.ShaderProperty(OutlineShadeMix,"Shadow mix");
                        });
                    }
                }

                // MatCap
                UIHelper.ShurikenHeader("MatCap");
                materialEditor.DrawShaderPropertySameLIne(MatcapBlendMode);
                var useMatcap = MatcapBlendMode.floatValue;
                if(useMatcap != 3) // Not 'Unused'
                {
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Blend & Mask", "Blend and Mask Texture"), MatcapBlendMask, MatcapBlend);
                            materialEditor.TextureScaleOffsetPropertyIndent(MatcapBlendMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(MatcapBlendMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Color and Texture"), MatcapTexture, MatcapColor);
                            materialEditor.TextureScaleOffsetPropertyIndent(MatcapTexture);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(MatcapTextureUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        materialEditor.ShaderProperty(MatcapNormalMix, "Normal Map mix");
                        materialEditor.ShaderProperty(MatcapShadeMix,"Shadow mix");
                    });
                }

                // Reflection
                UIHelper.ShurikenHeader("Reflection");
                materialEditor.DrawShaderPropertySameLIne(UseReflection);
                var useReflection = UseReflection.floatValue;
                if(useReflection > 0)
                {
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(UseReflectionProbe,"Use Reflection Probe");
                        var useProbe = UseReflectionProbe.floatValue;
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Reflection Color", "Reflection Color Texture (RGB)"), ReflectionTexture, ReflectionColor);
                            materialEditor.TextureScaleOffsetPropertyIndent(ReflectionTexture);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(ReflectionTextureUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Smoothness & Mask", "Smoothness and Mask Texture"), ReflectionReflectionMask, ReflectionReflectionPower);
                            materialEditor.TextureScaleOffsetPropertyIndent(ReflectionReflectionMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(ReflectionReflectionMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            var cubemapLabel = "Cubemap";
                            if(useProbe > 0) {
                                cubemapLabel += "(fallback)";
                            }
                            materialEditor.TexturePropertySingleLine(new GUIContent(cubemapLabel, cubemapLabel), ReflectionCubemap);
                            materialEditor.TextureScaleOffsetPropertyIndent(ReflectionCubemap);
                        });
                        materialEditor.ShaderProperty(ReflectionNormalMix,"Normal Map mix");
                        materialEditor.ShaderProperty(ReflectionShadeMix, "Shadow mix");
                        materialEditor.ShaderProperty(ReflectionSuppressBaseColorValue,"Suppress Base Color");
                    });
                }

                // Rim Light
                UIHelper.ShurikenHeader("Rim");
                materialEditor.DrawShaderPropertySameLIne(UseRim);
                var useRim = UseRim.floatValue;
                if(useRim > 0)
                {
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Blend & Mask", "Blend and Mask Texture"), RimBlendMask, RimBlend);
                            materialEditor.TextureScaleOffsetPropertyIndent(RimBlendMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(RimBlendMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), RimTexture, RimColor);
                            materialEditor.TextureScaleOffsetPropertyIndent(RimTexture);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(RimTextureUV, "UV Channel");
                            EditorGUI.indentLevel--;
                            materialEditor.ShaderProperty(RimUseBaseTexture,"Use Base Color");
                        });
                        materialEditor.ShaderProperty(RimShadeMix,"Shadow mix");
                        materialEditor.ShaderProperty(RimFresnelPower,"Fresnel Power");
                        materialEditor.ShaderProperty(RimUpperSideWidth,"Upper side width");
                    });
                }

                // Shade Cap
                UIHelper.ShurikenHeader("Shade Cap");
                materialEditor.DrawShaderPropertySameLIne(ShadowCapBlendMode);
                var useShadowCap = ShadowCapBlendMode.floatValue;
                if(useShadowCap != 3) // Not 'Unused'
                {
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Blend & Mask", "Blend and Mask Texture"), ShadowCapBlendMask, ShadowCapBlend);
                            materialEditor.TextureScaleOffsetPropertyIndent(ShadowCapBlendMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(ShadowCapBlendMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Texture", "Texture"), ShadowCapTexture);
                            materialEditor.TextureScaleOffsetPropertyIndent(ShadowCapTexture);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(ShadowCapTextureUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        materialEditor.ShaderProperty(ShadowCapNormalMix,"Normal Map mix");
                    });
                }

                // Stencil Writer
                if(isStencilWriter)
                {
                    UIHelper.ShurikenHeader("Stencil Writer");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.ShaderProperty(StencilNumber,"Stencil Number");
                        if(isStencilWriterMask) {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Stencil Mask & Range", "Stencil Mask and Range"), StencilMaskTex, StencilMaskAdjust);
                            materialEditor.TextureScaleOffsetPropertyIndent(StencilMaskTex);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(StencilMaskTexUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        }
                        if(isStencilWriterMask) materialEditor.ShaderProperty(StencilMaskAlphaDither, "Alpha(Dither)");
                    });
                }

                // Stencil Reader
                if(isStencilReader)
                {
                    UIHelper.ShurikenHeader("Stencil Reader");
                    if(isStencilReaderDouble) {
                        UIHelper.DrawWithGroup(() => {
                            UIHelper.DrawWithGroup(() => {
                                EditorGUILayout.LabelField("Primary", EditorStyles.boldLabel);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(StencilNumber,"Number");
                                materialEditor.ShaderProperty(StencilCompareAction,"Compare Action");
                                EditorGUI.indentLevel--;
                            });
                            UIHelper.DrawWithGroup(() => {
                                EditorGUILayout.LabelField("Secondary", EditorStyles.boldLabel);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(StencilNumberSecondary,"Number");
                                materialEditor.ShaderProperty(StencilCompareActionSecondary,"Compare Action");
                                EditorGUI.indentLevel--;
                            });
                        });
                    } else {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.ShaderProperty(StencilNumber,"Number");
                            materialEditor.ShaderProperty(StencilCompareAction,"Compare Action");
                        });
                    }
                }

                // Parallax Emission
                UIHelper.ShurikenHeader("Parallaxed Emission");
                materialEditor.DrawShaderPropertySameLIne(UseEmissionParallax);
                var useEmissionPara = UseEmissionParallax.floatValue;
                if(useEmissionPara > 0){
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), EmissionParallaxTex, EmissionParallaxColor);
                            materialEditor.TextureScaleOffsetPropertyIndent(EmissionParallaxTex);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(EmissionParallaxTexUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("TexCol Mask", "Texture and Color Mask"), EmissionParallaxMask);
                            materialEditor.TextureScaleOffsetPropertyIndent(EmissionParallaxMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(EmissionParallaxMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                        });
                        UIHelper.DrawWithGroup(() => {
                            materialEditor.TexturePropertySingleLine(new GUIContent("Depth & Mask", "Depth and Mask Texture"), EmissionParallaxDepthMask, EmissionParallaxDepth);
                            materialEditor.TextureScaleOffsetPropertyIndent(EmissionParallaxDepthMask);
                            EditorGUI.indentLevel++;
                            materialEditor.ShaderProperty(EmissionParallaxDepthMaskUV, "UV Channel");
                            EditorGUI.indentLevel--;
                            materialEditor.ShaderProperty(EmissionParallaxDepthMaskInvert, "Invert Depth Mask");
                        });
                    });
                }

                // Scrolled Emission
                if(isEmissiveFreak)
                {
                    UIHelper.ShurikenHeader("Emissive Freak");
                    UIHelper.DrawWithGroup(() => {
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("1st", EditorStyles.boldLabel);
                            UIHelper.DrawWithGroup(() => {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), EmissiveFreak1Tex, EmissiveFreak1Color);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak1Tex);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveFreak1TexUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                materialEditor.TexturePropertySingleLine(new GUIContent("TexCol Mask", "Texture and Color Mask"), EmissiveFreak1Mask);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak1Mask);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveFreak1MaskUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.ShaderProperty(EmissiveFreak1U, "Scroll U");
                                    materialEditor.ShaderProperty(EmissiveFreak1V, "Scroll V");
                                });
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Depth & Mask", "Depth and Mask Texture"), EmissiveFreak1DepthMask, EmissiveFreak1Depth);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak1DepthMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveFreak1DepthMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                    materialEditor.ShaderProperty(EmissiveFreak1DepthMaskInvert, "Invert Depth Mask");
                                });
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.ShaderProperty(EmissiveFreak1Breathing, "Breathing");
                                    materialEditor.ShaderProperty(EmissiveFreak1BreathingMix, "Breathing Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak1BlinkOut, "Blink Out");
                                    materialEditor.ShaderProperty(EmissiveFreak1BlinkOutMix, "Blink Out Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak1BlinkIn, "Blink In");
                                    materialEditor.ShaderProperty(EmissiveFreak1BlinkInMix, "Blink In Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak1HueShift, "Hue Shift");
                                });
                            });
                        });

                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("2nd", EditorStyles.boldLabel);
                            UIHelper.DrawWithGroup(() => {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), EmissiveFreak2Tex, EmissiveFreak2Color);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak2Tex);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveFreak2TexUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                materialEditor.TexturePropertySingleLine(new GUIContent("TexCol Mask", "Texture and Color Mask"), EmissiveFreak2Mask);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak2Mask);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveFreak2MaskUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.ShaderProperty(EmissiveFreak2U, "Scroll U");
                                    materialEditor.ShaderProperty(EmissiveFreak2V, "Scroll V");
                                });
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Depth & Mask", "Depth and Mask Texture"), EmissiveFreak2DepthMask, EmissiveFreak2Depth);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveFreak2DepthMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveFreak2DepthMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                    materialEditor.ShaderProperty(EmissiveFreak2DepthMaskInvert, "Invert Depth Mask");
                                });
                                UIHelper.DrawWithGroup(() => {
                                    materialEditor.ShaderProperty(EmissiveFreak2Breathing, "Breathing");
                                    materialEditor.ShaderProperty(EmissiveFreak2BreathingMix, "Breathing Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak2BlinkOut, "Blink Out");
                                    materialEditor.ShaderProperty(EmissiveFreak2BlinkOutMix, "Blink Out Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak2BlinkIn, "Blink In");
                                    materialEditor.ShaderProperty(EmissiveFreak2BlinkInMix, "Blink In Mix");
                                    materialEditor.ShaderProperty(EmissiveFreak2HueShift, "Hue Shift");
                                });
                            });
                        });
                    });
                }

                // Emissive Waves
                if (isEmissiveWaves)
                {
                    UIHelper.ShurikenHeader("Emissive Waves");
                    UIHelper.DrawWithGroup(() => {
                        materialEditor.TexturePropertySingleLine(new GUIContent("Texture & Color", "Texture and Color"), EmissiveWaves1Tex, EmissiveWaves1Color);
                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1Tex);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(EmissiveWaves1TexUV, "UV Channel");
                        EditorGUI.indentLevel--;

                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Trace", EditorStyles.boldLabel);
                            materialEditor.ShaderProperty(UseEmissiveWaves1Trace, "Use Trace");
                            if (UseEmissiveWaves1Trace.floatValue > 0)
                            {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Trace Map", "Trace Map Texture"), EmissiveWaves1TraceMap);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceMap);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveWaves1TraceMapUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                materialEditor.ShaderProperty(EmissiveWaves1UseSecond, "Use Second Channel");
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Trace Common", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceAmount, "Amount");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceFreq, "Freq");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOffset, "Offset");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Amount & Freq & Offset Mask", "Amount and Freq and Offset Mask Texture"), EmissiveWaves1TraceAFOMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceAFOMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceAFOMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Trace In Out Ratio", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInOutRatio, "Ratio");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseTraceInOutRatioMap, "Use Ratio Map");
                                    if (EmissiveWaves1UseTraceInOutRatioMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Ratio Map", "Ratio Map Texture"), EmissiveWaves1TraceInOutRatioMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceInOutRatioMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1TraceInOutRatioMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                });
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Trace In", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInSmooth, "Smooth");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseTraceInSmoothMap, "Use Smooth Map");
                                    if (EmissiveWaves1UseTraceInSmoothMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Smooth Map", "Smooth Map Texture"), EmissiveWaves1TraceInSmoothMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceInSmoothMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1TraceInSmoothMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInWidth, "Width");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInSoftness, "Softness");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInBias, "Bias");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Width & Softness & Bias Mask", "Width and Softness and Bias Mask Texture"), EmissiveWaves1TraceInWSBMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceInWSBMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceInWSBMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Trace Out", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOutSmooth, "Smooth");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseTraceOutSmoothMap, "Use Smooth Map");
                                    if (EmissiveWaves1UseTraceOutSmoothMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Smooth Map", "Smooth Map Texture"), EmissiveWaves1TraceOutSmoothMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceOutSmoothMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1TraceOutSmoothMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOutWidth, "Width");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOutSoftness, "Softness");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOutBias, "Bias");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Width & Softness & Bias Mask", "Width and Softness and Bias Mask Texture"), EmissiveWaves1TraceOutWSBMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceOutWSBMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceOutWSBMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Trace Unison", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceUnison, "Unison Count");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseTraceUnisonMap, "Use Unison Count Map");
                                    if (EmissiveWaves1UseTraceUnisonMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Unison Count Map", "Unison Count Map Texture"), EmissiveWaves1TraceUnisonMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceUnisonMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1TraceUnisonMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceUnisonFreqMulti, "Freq Multi");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceUnisonDecay, "Decay");
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceUnisonOffset, "Offset");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Freq Multi & Decay & Offset Mask", "Freq Multi and Decay and Offset Mask Texture"), EmissiveWaves1TraceUnisonFDOMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TraceUnisonFDOMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TraceUnisonFDOMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                            }
                        });

                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Blink", EditorStyles.boldLabel);
                            materialEditor.ShaderProperty(UseEmissiveWaves1Blink, "Use Blink");
                            if (UseEmissiveWaves1Blink.floatValue > 0)
                            {
                                materialEditor.ShaderProperty(EmissiveWaves1BlinkType, "Blink Type");
                                materialEditor.ShaderProperty(EmissiveWaves1UseBlinkTypeMap, "Use Blink Type Map");
                                if (EmissiveWaves1UseBlinkTypeMap.floatValue > 0)
                                {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Blink Type Map", "Blink Type Map Texture"), EmissiveWaves1BlinkTypeMap);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkTypeMap);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkTypeMapUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                }
                                materialEditor.TexturePropertySingleLine(new GUIContent("Custom Wave Map", "Custom Wave Map Texture"), EmissiveWaves1BlinkCustomWaveMap);
                                materialEditor.ShaderProperty(EmissiveWaves1BlinkInvert, "Blink Invert");
                                materialEditor.ShaderProperty(EmissiveWaves1UseBlinkInvertMap, "Use Blink Invert Map");
                                if (EmissiveWaves1UseBlinkInvertMap.floatValue > 0)
                                {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Blink Invert Map", "Blink Invert Map Texture"), EmissiveWaves1BlinkInvertMap);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkInvertMap);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkInvertMapUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                }
                                materialEditor.ShaderProperty(EmissiveWaves1BlinkPower, "Blink Power");
                                materialEditor.TexturePropertySingleLine(new GUIContent("Blink Power Mask", "Blink Power Mask Texture"), EmissiveWaves1BlinkPowerMask);
                                materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkPowerMask);
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(EmissiveWaves1BlinkPowerMaskUV, "UV Channel");
                                EditorGUI.indentLevel--;
                                materialEditor.ShaderProperty(EmissiveWaves1BlinkPowerInvert, "Blink Power Invert");
                                materialEditor.ShaderProperty(EmissiveWaves1UseBlinkPowerInvertMap, "Use Blink Power Invert Map");
                                if (EmissiveWaves1UseBlinkPowerInvertMap.floatValue > 0)
                                {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Blink Power Invert Map", "Blink Power Invert Map Texture"), EmissiveWaves1BlinkPowerInvertMap);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkPowerInvertMap);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkPowerInvertMapUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                }
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Blink Common", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkAmount, "Amount");
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkFreq, "Freq");
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkOffset, "Offset");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Amount & Freq & Offset Mask", "Freq and Offset Mask Texture"), EmissiveWaves1BlinkAFOMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkAFOMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkAFOMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Blink Unison", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnison, "Unison Count");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseBlinkUnisonMap, "Use Unison Count Map");
                                    if (EmissiveWaves1UseBlinkUnisonMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Unison Count Map", "Unison Count Map Texture"), EmissiveWaves1BlinkUnisonMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkUnisonMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonFreqMulti, "Freq Multi");
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonDecay, "Decay");
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonOffset, "Offset");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Freq Multi & Decay & Offset Mask", "Freq Multi and Decay and Offset Mask Texture"), EmissiveWaves1BlinkUnisonFDOMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkUnisonFDOMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonFDOMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                    materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonNormalize, "Normalize");
                                    materialEditor.ShaderProperty(EmissiveWaves1UseBlinkUnisonNormalizeMap, "Use Normalize Map");
                                    if (EmissiveWaves1UseBlinkUnisonNormalizeMap.floatValue > 0)
                                    {
                                        materialEditor.TexturePropertySingleLine(new GUIContent("Normalize Map", "Normalize Map Texture"), EmissiveWaves1BlinkUnisonNormalizeMap);
                                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1BlinkUnisonNormalizeMap);
                                        EditorGUI.indentLevel++;
                                        materialEditor.ShaderProperty(EmissiveWaves1BlinkUnisonNormalizeMapUV, "UV Channel");
                                        EditorGUI.indentLevel--;
                                    }
                                });
                            }
                        });

                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Tint", EditorStyles.boldLabel);
                            materialEditor.ShaderProperty(UseEmissiveWaves1Tint, "Use Tint");
                            if (UseEmissiveWaves1Tint.floatValue > 0)
                            {
                                materialEditor.TexturePropertySingleLine(new GUIContent("Tint Map & Color A", "Tint Map Texture and Color Type A"), EmissiveWaves1TintMapA, EmissiveWaves1TintColorA);
                                materialEditor.TexturePropertySingleLine(new GUIContent("Tint Map & Color B", "Tint Map Texture and Color Type B"), EmissiveWaves1TintMapB, EmissiveWaves1TintColorB);
                                materialEditor.TexturePropertySingleLine(new GUIContent("Tint Map & Color C", "Tint Map Texture and Color Type C"), EmissiveWaves1TintMapC, EmissiveWaves1TintColorC);
                                materialEditor.ShaderProperty(EmissiveWaves1TintType, "Tint Type");
                                materialEditor.ShaderProperty(EmissiveWaves1UseTintTypeMap, "Use Tint Type Map");
                                if (EmissiveWaves1UseTintTypeMap.floatValue > 0)
                                {
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Tint Type Map", "Tint Type Map Texture"), EmissiveWaves1TintTypeMap);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TintTypeMap);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TintTypeMapUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                }
                                UIHelper.DrawWithGroup(() => {
                                    EditorGUILayout.LabelField("Tint Common", EditorStyles.boldLabel);
                                    materialEditor.ShaderProperty(EmissiveWaves1TintAmount, "Amount");
                                    materialEditor.ShaderProperty(EmissiveWaves1TintFreq, "Freq");
                                    materialEditor.ShaderProperty(EmissiveWaves1TintOffset, "Offset");
                                    materialEditor.TexturePropertySingleLine(new GUIContent("Amount & Freq & Offset Mask", "Freq and Offset Mask Texture"), EmissiveWaves1TintAFOMask);
                                    materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1TintAFOMask);
                                    EditorGUI.indentLevel++;
                                    materialEditor.ShaderProperty(EmissiveWaves1TintAFOMaskUV, "UV Channel");
                                    EditorGUI.indentLevel--;
                                });
                            }
                        });

                        materialEditor.ShaderProperty(EmissiveWaves1HueShift, "Hue Shift Speed");
                        materialEditor.TexturePropertySingleLine(new GUIContent("Hue Shift Speed Mask", "Hue Shift Speed Mask Texture"), EmissiveWaves1HueShiftMask);
                        materialEditor.TextureScaleOffsetPropertyIndent(EmissiveWaves1HueShiftMask);
                        EditorGUI.indentLevel++;
                        materialEditor.ShaderProperty(EmissiveWaves1HueShiftMaskUV, "UV Channel");
                        EditorGUI.indentLevel--;
                    });
                }

                // Advanced / Experimental
                IsShowAdvanced = UIHelper.ShurikenFoldout("Advanced / Experimental (Click to Open)", IsShowAdvanced);
                if (IsShowAdvanced) {
                    UIHelper.DrawWithGroup(() => {
                        EditorGUILayout.HelpBox("These are some shade tweaking. no need to change usually." + Environment.NewLine + "ほとんどのケースで触る必要のないやつら。",MessageType.Info);
                        if (GUILayout.Button("Revert advanced params.")){
                            PointAddIntensity.floatValue = 1f;
                            PointShadowStrength.floatValue = 0.5f;
                            PointShadowborder.floatValue = 0.5f;
                            PointShadowborderBlur.floatValue = 0.01f;
                            PointShadowborderBlurMask.textureValue = null;
                            OtherShadowAdjust.floatValue = -0.1f;
                            OtherShadowBorderSharpness.floatValue = 3;
                            PointShadowUseStep.floatValue = 0;
                            PointShadowSteps.floatValue = 2;
                            ShadowIndirectIntensity.floatValue = 0.25f;
                            VertexColorBlendDiffuse.floatValue = 0f;
                            VertexColorBlendEmissive.floatValue = 0f;
                            UseVertexLight.floatValue = 1f;
                            LightSampling.floatValue = 0f;
                            UsePositionRelatedCalc.floatValue = 0f;
                        }
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Lights", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(LightSampling, "Sampling Style (def:arktoon)");
                            EditorGUI.indentLevel --;
                        });
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Directional Shadow", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(ShadowIndirectIntensity, "Indirect face Intensity (0.25)");
                            EditorGUI.indentLevel --;
                        });
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Vertex Colors", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(VertexColorBlendDiffuse, "Color blend to diffuse (def:0) ");
                            materialEditor.ShaderProperty(VertexColorBlendEmissive, "Color blend to emissive (def:0) ");
                            EditorGUI.indentLevel --;
                        });
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("PointLights", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(PointAddIntensity, "Intensity (def:1)");
                            materialEditor.ShaderProperty(PointShadowStrength, "Shadow Strength (def:0.5)");
                            materialEditor.ShaderProperty(PointShadowborder, "Shadow Border (def:0.5)");
                            materialEditor.ShaderProperty(PointShadowborderBlur, "Shadow Border blur (def:0.01)");
                            materialEditor.ShaderProperty(PointShadowborderBlurMask, "Shadow Border blur Mask(def:none)");
                            materialEditor.ShaderProperty(PointShadowUseStep, "Use Shadow Steps");
                            var usePointStep = PointShadowUseStep.floatValue;
                            if(usePointStep > 0)
                            {
                                materialEditor.ShaderProperty(PointShadowSteps, " ");
                            }
                            materialEditor.ShaderProperty(UseVertexLight, "Use Per-vertex Light");
                            EditorGUI.indentLevel --;
                        });
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("Shade from other meshes", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(OtherShadowAdjust, "Adjust (def:-0.1)");
                            materialEditor.ShaderProperty(OtherShadowBorderSharpness, "Sharpness(def:3)");
                            EditorGUI.indentLevel --;
                        });
                        UIHelper.DrawWithGroup(() => {
                            EditorGUILayout.LabelField("MatCap / ShadeCap", EditorStyles.boldLabel);
                            EditorGUI.indentLevel ++;
                            materialEditor.ShaderProperty(UsePositionRelatedCalc, "Use Position Related Calc(def: no)");
                            EditorGUI.indentLevel --;
                        });
                    });
                }

                // Arktoon version info
                string version =  EditorUserSettings.GetConfigValue ("arktoon+T_version");

                UIHelper.ShurikenHeader("Arktoon+T-Shaders");
                style.alignment = TextAnchor.MiddleRight;
                style.normal.textColor = EditorGUIUtility.isProSkin ? Color.white : Color.black;
                EditorGUILayout.LabelField("Version : " + version, style);

                // Docs
                UIHelper.DrawWithGroupHorizontal(() => {
                    if(GUILayout.Button("How to use"))
                    {
                        System.Diagnostics.Process.Start("https://tokage.info/lab/");
                    }
                    if(GUILayout.Button("README.md"))
                    {
                        System.Diagnostics.Process.Start("https://github.com/TokageItLab/ArktoonPlusT-Shaders/blob/master/README.md");
                    }
                });
            }
            EditorGUI.EndChangeCheck();
        }
    }

    static class UIHelper
    {
        static int HEADER_HEIGHT = 22;

        public static void DrawShaderPropertySameLIne(this MaterialEditor editor, MaterialProperty property) {
            Rect r = EditorGUILayout.GetControlRect(true,0,EditorStyles.layerMaskField);
            r.y -= HEADER_HEIGHT;
            r.height = MaterialEditor.GetDefaultPropertyHeight(property);
            editor.ShaderProperty(r, property, " ");
        }

        private static Rect DrawShuriken(string title, Vector2 contentOffset) {
            var style = new GUIStyle("ShurikenModuleTitle");
            style.margin = new RectOffset(0, 0, 8, 0);
            style.font = new GUIStyle(EditorStyles.boldLabel).font;
            style.border = new RectOffset(15, 7, 4, 4);
            style.fixedHeight = HEADER_HEIGHT;
            style.contentOffset = contentOffset;
            var rect = GUILayoutUtility.GetRect(16f, HEADER_HEIGHT, style);
            GUI.Box(rect, title, style);
            return rect;
        }
        public static void ShurikenHeader(string title)
        {
            DrawShuriken(title,new Vector2(6f, -2f));
        }
        public static bool ShurikenFoldout(string title, bool display)
        {
            var rect = DrawShuriken(title,new Vector2(20f, -2f));
            var e = Event.current;
            var toggleRect = new Rect(rect.x + 4f, rect.y + 2f, 13f, 13f);
            if (e.type == EventType.Repaint) {
                EditorStyles.foldout.Draw(toggleRect, false, false, display, false);
            }
            if (e.type == EventType.MouseDown && rect.Contains(e.mousePosition)) {
                display = !display;
                e.Use();
            }
            return display;
        }
        public static void Vector2Property(MaterialProperty property, string name)
        {
            EditorGUI.BeginChangeCheck();
            Vector2 vector2 = EditorGUILayout.Vector2Field(name,new Vector2(property.vectorValue.x, property.vectorValue.y),null);
            if (EditorGUI.EndChangeCheck())
                property.vectorValue = new Vector4(vector2.x, vector2.y);
        }
        public static void Vector4Property(MaterialProperty property, string name)
        {
            EditorGUI.BeginChangeCheck();
            Vector4 vector4 = EditorGUILayout.Vector2Field(name,property.vectorValue,null);
            if (EditorGUI.EndChangeCheck())
                property.vectorValue = vector4;
        }
        public static void Vector2PropertyZW(MaterialProperty property, string name)
        {
            EditorGUI.BeginChangeCheck();
            Vector2 vector2 = EditorGUILayout.Vector2Field(name,new Vector2(property.vectorValue.x, property.vectorValue.y),null);
            if (EditorGUI.EndChangeCheck())
                property.vectorValue = new Vector4(vector2.x, vector2.y);
        }
        public static void TextureScaleOffsetPropertyIndent(this MaterialEditor editor, MaterialProperty property)
        {
            EditorGUI.indentLevel ++;
            editor.TextureScaleOffsetProperty(property);
            EditorGUI.indentLevel --;
        }
        public static void DrawWithGroup(Action action)
        {
            EditorGUILayout.BeginVertical( GUI.skin.box );
            action();
            EditorGUILayout.EndVertical();
        }
        public static void DrawWithGroupHorizontal(Action action)
        {
            EditorGUILayout.BeginHorizontal( GUI.skin.box );
            action();
            EditorGUILayout.EndHorizontal();
        }
    }

    // シェーダーキーワードを作らないToggle (Unity 2018.2以降で存在するUIToggleと同じ。)
    internal class MaterialATSToggleDrawer : MaterialPropertyDrawer
    {
        public MaterialATSToggleDrawer()
        {
        }

        public MaterialATSToggleDrawer(string keyword)
        {
        }

        protected virtual void SetKeyword(MaterialProperty prop, bool on)
        {
        }

        static bool IsPropertyTypeSuitable(MaterialProperty prop)
        {
            return prop.type == MaterialProperty.PropType.Float || prop.type == MaterialProperty.PropType.Range;
        }

        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return base.GetPropertyHeight(prop, label, editor);
        }

        public override void OnGUI(Rect position, MaterialProperty prop, GUIContent label, MaterialEditor editor)
        {
            EditorGUI.BeginChangeCheck();

            bool value = (Math.Abs(prop.floatValue) > 0.001f);
            EditorGUI.showMixedValue = prop.hasMixedValue;
            value = EditorGUI.Toggle(position, label, value);
            EditorGUI.showMixedValue = false;
            if (EditorGUI.EndChangeCheck())
            {
                prop.floatValue = value ? 1.0f : 0.0f;
                SetKeyword(prop, value);
            }
        }

        public override void Apply(MaterialProperty prop)
        {
            base.Apply(prop);
            if (!IsPropertyTypeSuitable(prop))
                return;

            if (prop.hasMixedValue)
                return;

            SetKeyword(prop, (Math.Abs(prop.floatValue) > 0.001f));
        }
    }

}