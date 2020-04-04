#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "Lighting.cginc"

// Transform UV
uniform int _UseTransformUV;
uniform int _UseTransformUVScroll;
UNITY_DECLARE_TEX2D(_TransformUVScrollMap); uniform float4 _TransformUVScrollMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_TransformUVScrollSpeedMap); uniform float4 _TransformUVScrollSpeedMap_ST;
uniform float _TransformUVScrollSpeed;
uniform int _UseTransformUVRotate;
UNITY_DECLARE_TEX2D(_TransformUVRotateMap); uniform float4 _TransformUVRotateMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_TransformUVRotateSpeedMap); uniform float4 _TransformUVRotateSpeedMap_ST;
uniform float _TransformUVRotateSpeed;

uniform int _UseTransformUV2;
uniform int _UseTransformUV2Scroll;
UNITY_DECLARE_TEX2D(_TransformUV2ScrollMap); uniform float4 _TransformUV2ScrollMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_TransformUV2ScrollSpeedMap); uniform float4 _TransformUV2ScrollSpeedMap_ST;
uniform float _TransformUV2ScrollSpeed;
uniform int _UseTransformUV2Rotate;
UNITY_DECLARE_TEX2D(_TransformUV2RotateMap); uniform float4 _TransformUV2RotateMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_TransformUV2RotateSpeedMap); uniform float4 _TransformUV2RotateSpeedMap_ST;
uniform float _TransformUV2RotateSpeed;

#if defined(ARKTOON_SECONDARY)
    // Secondary
    UNITY_DECLARE_TEX2D(_MainTexSecondary); uniform float4 _MainTexSecondary_ST; uniform int _MainTexUVSecondary;
    uniform float4 _ColorSecondary;
    uniform sampler2D _BumpMapSecondary; uniform float4 _BumpMapSecondary_ST; uniform int _BumpMapUVSecondary;
    uniform float _BumpScaleSecondary;
    uniform sampler2D _EmissionMapSecondary; uniform float4 _EmissionMapSecondary_ST; uniform int _EmissionMapUVSecondary;
    uniform float4 _EmissionColorSecondary;
    uniform sampler2D _Emission2MapSecondary; uniform float4 _Emission2MapSecondary_ST; uniform int _Emission2MapUVSecondary;
    uniform float4 _Emission2ColorSecondary;
#   define REF_MAINTEX _MainTexSecondary
#   define REF_MAINTEXUV _MainTexUVSecondary
#   define REF_COLOR _ColorSecondary
#   define REF_BUMPMAP _BumpMapSecondary
#   define REF_BUMPMAPUV _BumpMapUVSecondary
#   define REF_BUMPSCALE _BumpScaleSecondary
#   define REF_EMISSIONMAP _EmissionMapSecondary
#   define REF_EMISSIONMAPUV _EmissionMapUVSecondary
#   define REF_EMISSIONCOLOR _EmissionColorSecondary
#   define REF_EMISSION2MAP _Emission2MapSecondary
#   define REF_EMISSION2MAPUV _Emission2MapUVSecondary
#   define REF_EMISSION2COLOR _Emission2ColorSecondary
#else
    // Main, Normal, Emission
    UNITY_DECLARE_TEX2D(_MainTex); uniform float4 _MainTex_ST; uniform int _MainTexUV;
    uniform float4 _Color;
    uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST; uniform int _BumpMapUV;
    uniform float _BumpScale;
    uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST; uniform int _EmissionMapUV;
    uniform float4 _EmissionColor;
    uniform sampler2D _Emission2Map; uniform float4 _Emission2Map_ST; uniform int _Emission2MapUV;
    uniform float4 _Emission2Color;
#   define REF_MAINTEX _MainTex
#   define REF_MAINTEXUV _MainTexUV
#   define REF_COLOR _Color
#   define REF_BUMPMAP _BumpMap
#   define REF_BUMPMAPUV _BumpMapUV
#   define REF_BUMPSCALE _BumpScale
#   define REF_EMISSIONMAP _EmissionMap
#   define REF_EMISSIONMAPUV _EmissionMapUV
#   define REF_EMISSIONCOLOR _EmissionColor
#   define REF_EMISSION2MAP _Emission2Map
#   define REF_EMISSION2MAPUV _Emission2MapUV
#   define REF_EMISSION2COLOR _Emission2Color
#endif
uniform float _LightColorSaturation;
UNITY_DECLARE_TEX2D_NOSAMPLER(_LightColorSaturationMask); uniform float4 _LightColorSaturationMask_ST; uniform int _LightColorSaturationMaskUV;

// Alpha Mask
UNITY_DECLARE_TEX2D_NOSAMPLER(_AlphaMask); uniform float4 _AlphaMask_ST; uniform int _AlphaMaskUV;

// Emission Parallax
uniform float _UseEmissionParallax;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissionParallaxTex); uniform float4 _EmissionParallaxTex_ST; uniform int _EmissionParallaxTexUV;
uniform float4 _EmissionParallaxColor;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissionParallaxMask); uniform float4 _EmissionParallaxMask_ST; uniform int _EmissionParallaxMaskUV;
uniform float _EmissionParallaxDepth;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissionParallaxDepthMask); uniform float4 _EmissionParallaxDepthMask_ST; uniform int _EmissionParallaxDepthMaskUV;
uniform float _EmissionParallaxDepthMaskInvert;

// Double Side
uniform int _UseDoubleSided;
uniform float _DoubleSidedBackfaceLightIntensity;
uniform int _DoubleSidedBackfaceUseColorShift;
uniform float _DoubleSidedBackfaceHueShiftFromBase;
uniform float _DoubleSidedBackfaceSaturationFromBase;
uniform float _DoubleSidedBackfaceValueFromBase;
uniform float _DoubleSidedFlipBackfaceNormal;

// Shadow
uniform float _Shadowborder;
uniform float _ShadowborderBlur;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowborderBlurMask); uniform float4 _ShadowborderBlurMask_ST; uniform int _ShadowborderBlurMaskUV;
uniform float _ShadowStrength;
uniform float _ShadowIndirectIntensity;
uniform float _ShadowUseStep;
uniform int _ShadowSteps;
uniform sampler2D _ShadowStrengthMask; uniform float4 _ShadowStrengthMask_ST; uniform int _ShadowStrengthMaskUV;

// Custom shade1
uniform int _ShadowPlanBUsePlanB;
uniform float _ShadowPlanBDefaultShadowMix;
uniform float _ShadowPlanBHueShiftFromBase;
uniform float _ShadowPlanBSaturationFromBase;
uniform float _ShadowPlanBValueFromBase;
uniform int _ShadowPlanBUseCustomShadowTexture;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowPlanBCustomShadowTexture); uniform float4 _ShadowPlanBCustomShadowTexture_ST; uniform int _ShadowPlanBCustomShadowTextureUV;
uniform float4 _ShadowPlanBCustomShadowTextureRGB;

// Cutsom shade2
uniform int _CustomShadow2nd;
uniform float _ShadowPlanB2border;
uniform float _ShadowPlanB2borderBlur;
uniform float _ShadowPlanB2HueShiftFromBase;
uniform float _ShadowPlanB2SaturationFromBase;
uniform float _ShadowPlanB2ValueFromBase;
uniform int _ShadowPlanB2UseCustomShadowTexture;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowPlanB2CustomShadowTexture); uniform float4 _ShadowPlanB2CustomShadowTexture_ST; uniform int _ShadowPlanB2CustomShadowTextureUV;
uniform float4 _ShadowPlanB2CustomShadowTextureRGB;

// Outline
uniform int _UseOutline;
UNITY_DECLARE_TEX2D_NOSAMPLER(_OutlineMask); uniform float4 _OutlineMask_ST; uniform int _OutlineMaskUV;
uniform float _OutlineCutoffRange;
uniform float _OutlineTextureColorRate;
uniform float _OutlineShadeMix;
uniform float _OutlineWidth;
uniform float4 _OutlineColor;
uniform sampler2D _OutlineTexture; uniform float4 _OutlineTexture_ST; uniform int _OutlineTextureUV;
uniform sampler2D _OutlineWidthMask; uniform float4 _OutlineWidthMask_ST; uniform int _OutlineWidthMaskUV; // FIXME:tex2dLodはUNITY_SAMPLE_TEX2D_SAMPLERの代用が判らないためいったん保留
uniform float _OutlineUseColorShift;
uniform float _OutlineHueShiftFromBase;
uniform float _OutlineSaturationFromBase;
uniform float _OutlineValueFromBase;

// Gloss
uniform int _UseGloss;
uniform float4 _GlossColor;
UNITY_DECLARE_TEX2D_NOSAMPLER(_GlossTexture); uniform float4 _GlossTexture_ST; uniform int _GlossTextureUV;
uniform float _GlossBlend;
UNITY_DECLARE_TEX2D_NOSAMPLER(_GlossBlendMask); uniform float4 _GlossBlendMask_ST; uniform int _GlossBlendMaskUV;
uniform float _GlossPower;
uniform float _CutoutCutoutAdjust;

// Point lights
uniform float _PointAddIntensity;
uniform float _PointShadowStrength;
uniform float _PointShadowborder;
uniform float _PointShadowborderBlur;
UNITY_DECLARE_TEX2D_NOSAMPLER(_PointShadowborderBlurMask); uniform float4 _PointShadowborderBlurMask_ST; uniform int _PointShadowborderBlurMaskUV;
uniform float _PointShadowUseStep;
uniform int _PointShadowSteps;

// MatCap
uniform int _MatcapBlendMode;
UNITY_DECLARE_TEX2D_NOSAMPLER(_MatcapTexture); uniform float4 _MatcapTexture_ST; uniform int _MatcapTextureUV;
uniform float _MatcapBlend;
UNITY_DECLARE_TEX2D_NOSAMPLER(_MatcapBlendMask); uniform float4 _MatcapBlendMask_ST; uniform int _MatcapBlendMaskUV;
uniform float4 _MatcapColor;
uniform float _MatcapNormalMix;
uniform float _MatcapShadeMix;

// Reflection
uniform int _UseReflection;
uniform int _UseReflectionProbe;
uniform float4 _ReflectionColor;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ReflectionTexture); uniform float4 _ReflectionTexture_ST; uniform int _ReflectionTextureUV;
uniform float _ReflectionReflectionPower;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ReflectionReflectionMask); uniform float4 _ReflectionReflectionMask_ST; uniform int _ReflectionReflectionMaskUV;
uniform float _ReflectionNormalMix;
uniform float _ReflectionShadeMix;
uniform float _ReflectionSuppressBaseColorValue;
uniform samplerCUBE _ReflectionCubemap;
uniform half4  _ReflectionCubemap_HDR;

// Rim
uniform int _UseRim;
uniform float _RimFresnelPower;
uniform float _RimUpperSideWidth;
uniform float4 _RimColor;
uniform fixed _RimUseBaseTexture;
uniform float _RimBlend;
uniform float _RimShadeMix;
UNITY_DECLARE_TEX2D_NOSAMPLER(_RimBlendMask); uniform float4 _RimBlendMask_ST; uniform int _RimBlendMaskUV;
UNITY_DECLARE_TEX2D_NOSAMPLER(_RimTexture); uniform float4 _RimTexture_ST; uniform int _RimTextureUV;

// Shade cap (Shadow cap)
uniform int _ShadowCapBlendMode;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowCapTexture); uniform float4 _ShadowCapTexture_ST; uniform int _ShadowCapTextureUV;
UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowCapBlendMask); uniform float4 _ShadowCapBlendMask_ST; uniform int _ShadowCapBlendMaskUV;
uniform float _ShadowCapBlend;
uniform float _ShadowCapNormalMix;

// Use vertexLight
uniform int _UseVertexLight;

// Vertex Color Blend
uniform float _VertexColorBlendDiffuse;
uniform float _VertexColorBlendEmissive;

// Shade from other objects.
uniform float _OtherShadowAdjust;
uniform float _OtherShadowBorderSharpness;

// Experimental Cap calculation
uniform int _UsePositionRelatedCalc;

// light sampling
uniform int _LightSampling;

// Refraction IF refracted
#ifdef ARKTOON_REFRACTED
uniform sampler2D _GrabTexture;
uniform float _RefractionFresnelExp;
uniform float _RefractionStrength;
#endif

// ScrolledEmission
#ifdef ARKTOON_EMISSIVE_FREAK
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak1Tex); uniform float4 _EmissiveFreak1Tex_ST; uniform int _EmissiveFreak1TexUV;
uniform float4 _EmissiveFreak1Color;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak1Mask); uniform float4 _EmissiveFreak1Mask_ST; uniform int _EmissiveFreak1MaskUV;
uniform float _EmissiveFreak1U;
uniform float _EmissiveFreak1V;
uniform float _EmissiveFreak1Depth;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak1DepthMask); uniform float4 _EmissiveFreak1DepthMask_ST; uniform int _EmissiveFreak1DepthMaskUV;
uniform float _EmissiveFreak1DepthMaskInvert;
uniform float _EmissiveFreak1Breathing;
uniform float _EmissiveFreak1BreathingMix;
uniform float _EmissiveFreak1BlinkOut;
uniform float _EmissiveFreak1BlinkOutMix;
uniform float _EmissiveFreak1BlinkIn;
uniform float _EmissiveFreak1BlinkInMix;
uniform float _EmissiveFreak1HueShift;

UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak2Tex); uniform float4 _EmissiveFreak2Tex_ST; uniform int _EmissiveFreak2TexUV;
uniform float4 _EmissiveFreak2Color;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak2Mask); uniform float4 _EmissiveFreak2Mask_ST; uniform int _EmissiveFreak2MaskUV;
uniform float _EmissiveFreak2U;
uniform float _EmissiveFreak2V;
uniform float _EmissiveFreak2Depth;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveFreak2DepthMask); uniform float4 _EmissiveFreak2DepthMask_ST; uniform int _EmissiveFreak2DepthMaskUV;
uniform float _EmissiveFreak2DepthMaskInvert;
uniform float _EmissiveFreak2Breathing;
uniform float _EmissiveFreak2BreathingMix;
uniform float _EmissiveFreak2BlinkOut;
uniform float _EmissiveFreak2BlinkOutMix;
uniform float _EmissiveFreak2BlinkIn;
uniform float _EmissiveFreak2BlinkInMix;
uniform float _EmissiveFreak2HueShift;
#endif

// EmissiveWaves
#ifdef ARKTOON_EMISSIVE_WAVES
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1Tex); uniform float4 _EmissiveWaves1Tex_ST; uniform int _EmissiveWaves1TexUV;
uniform float4 _EmissiveWaves1Color;

uniform int _UseEmissiveWaves1Trace;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceMap); uniform float4 _EmissiveWaves1TraceMap_ST; uniform int _EmissiveWaves1TraceMapUV;
uniform int _EmissiveWaves1UseSecond;
uniform float _EmissiveWaves1TraceAmount;
uniform float _EmissiveWaves1TraceFreq;
uniform float _EmissiveWaves1TraceOffset;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceAFOMask); uniform float4 _EmissiveWaves1TraceAFOMask_ST; uniform int _EmissiveWaves1TraceAFOMaskUV;
uniform float _EmissiveWaves1TraceInOutRatio;
uniform int _EmissiveWaves1UseTraceInOutRatioMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceInOutRatioMap); uniform float4 _EmissiveWaves1TraceInOutRatioMap_ST; uniform int _EmissiveWaves1TraceInOutRatioMapUV;
uniform int _EmissiveWaves1TraceInSmooth;
uniform int _EmissiveWaves1UseTraceInSmoothMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceInSmoothMap); uniform float4 _EmissiveWaves1TraceInSmoothMap_ST; uniform int _EmissiveWaves1TraceInSmoothMapUV;
uniform float _EmissiveWaves1TraceInWidth;
uniform float _EmissiveWaves1TraceInSoftness;
uniform float _EmissiveWaves1TraceInBias;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceInWSBMask); uniform float4 _EmissiveWaves1TraceInWSBMask_ST; uniform int _EmissiveWaves1TraceInWSBMaskUV;
uniform int _EmissiveWaves1TraceOutSmooth;
uniform int _EmissiveWaves1UseTraceOutSmoothMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceOutSmoothMap); uniform float4 _EmissiveWaves1TraceOutSmoothMap_ST; uniform int _EmissiveWaves1TraceOutSmoothMapUV;
uniform float _EmissiveWaves1TraceOutWidth;
uniform float _EmissiveWaves1TraceOutSoftness;
uniform float _EmissiveWaves1TraceOutBias;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceOutWSBMask); uniform float4 _EmissiveWaves1TraceOutWSBMask_ST; uniform int _EmissiveWaves1TraceOutWSBMaskUV;
uniform int _EmissiveWaves1TraceUnison;
uniform int _EmissiveWaves1UseTraceUnisonMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceUnisonMap); uniform float4 _EmissiveWaves1TraceUnisonMap_ST; uniform int _EmissiveWaves1TraceUnisonMapUV;
uniform float _EmissiveWaves1TraceUnisonFreqMulti;
uniform float _EmissiveWaves1TraceUnisonDecay;
uniform float _EmissiveWaves1TraceUnisonOffset;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TraceUnisonFDOMask); uniform float4 _EmissiveWaves1TraceUnisonFDOMask_ST; uniform int _EmissiveWaves1TraceUnisonFDOMaskUV;

uniform int _UseEmissiveWaves1Blink;
uniform int _EmissiveWaves1BlinkType;
uniform int _EmissiveWaves1UseBlinkTypeMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkTypeMap); uniform float4 _EmissiveWaves1BlinkTypeMap_ST; uniform int _EmissiveWaves1BlinkTypeMapUV;
uniform sampler2D _EmissiveWaves1BlinkCustomWaveMap;
uniform int _EmissiveWaves1BlinkInvert;
uniform int _EmissiveWaves1UseBlinkInvertMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkInvertMap); uniform float4 _EmissiveWaves1BlinkInvertMap_ST; uniform int _EmissiveWaves1BlinkInvertMapUV;
uniform float _EmissiveWaves1BlinkPower;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkPowerMask); uniform float4 _EmissiveWaves1BlinkPowerMask_ST; uniform int _EmissiveWaves1BlinkPowerMaskUV;
uniform int _EmissiveWaves1BlinkPowerInvert;
uniform int _EmissiveWaves1UseBlinkPowerInvertMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkPowerInvertMap); uniform float4 _EmissiveWaves1BlinkPowerInvertMap_ST; uniform int _EmissiveWaves1BlinkPowerInvertMapUV;
uniform float _EmissiveWaves1BlinkAmount;
uniform float _EmissiveWaves1BlinkFreq;
uniform float _EmissiveWaves1BlinkOffset;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkAFOMask); uniform float4 _EmissiveWaves1BlinkAFOMask_ST; uniform int _EmissiveWaves1BlinkAFOMaskUV;
uniform int _EmissiveWaves1BlinkUnison;
uniform int _EmissiveWaves1UseBlinkUnisonMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkUnisonMap); uniform float4 _EmissiveWaves1BlinkUnisonMap_ST; uniform int _EmissiveWaves1BlinkUnisonMapUV;
uniform float _EmissiveWaves1BlinkUnisonFreqMulti;
uniform float _EmissiveWaves1BlinkUnisonDecay;
uniform float _EmissiveWaves1BlinkUnisonOffset;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkUnisonFDOMask); uniform float4 _EmissiveWaves1BlinkUnisonFDOMask_ST; uniform int _EmissiveWaves1BlinkUnisonFDOMaskUV;
uniform int _EmissiveWaves1BlinkUnisonNormalize;
uniform int _EmissiveWaves1UseBlinkUnisonNormalizeMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1BlinkUnisonNormalizeMap); uniform float4 _EmissiveWaves1BlinkUnisonNormalizeMap_ST; uniform int _EmissiveWaves1BlinkUnisonNormalizeMapUV;

uniform bool _UseEmissiveWaves1Tint;
uniform UNITY_DECLARE_TEX2D(_EmissiveWaves1TintMapA);
uniform float4 _EmissiveWaves1TintColorA;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TintMapB);
uniform float4 _EmissiveWaves1TintColorB;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TintMapC);
uniform float4 _EmissiveWaves1TintColorC;
uniform int _EmissiveWaves1TintType;
uniform int _EmissiveWaves1UseTintTypeMap;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TintTypeMap); uniform float4 _EmissiveWaves1TintTypeMap_ST; uniform int _EmissiveWaves1TintTypeMapUV;
uniform float _EmissiveWaves1TintAmount;
uniform float _EmissiveWaves1TintFreq;
uniform float _EmissiveWaves1TintOffset;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1TintAFOMask); uniform float4 _EmissiveWaves1TintAFOMask_ST; uniform int _EmissiveWaves1TintAFOMaskUV;

uniform float _EmissiveWaves1HueShift;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveWaves1HueShiftMask); uniform float4 _EmissiveWaves1HueShiftMask_ST; uniform int _EmissiveWaves1HueShiftMaskUV;
#endif