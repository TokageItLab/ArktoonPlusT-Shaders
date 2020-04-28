// Copyright (c) 2020 Tokage IT Lab.
//
// 本コードは Arktoon-Shaders に機能追加を行った物で、改変部に関してもライセンスは MIT License を適用します。
// 機能追加部分の詳細については（https://github.com/TokageItLab/ArktoonPlusT-Shader）を参照して下さい。
//
// Copyright (c) 2018 synqark
//
// This code and repos（https://github.com/synqark/Arktoon-Shader) is under MIT licence, see LICENSE
//
// 本コードおよびリポジトリ（https://github.com/synqark/Arktoon-Shader) は MIT License を使用して公開しています。
// 詳細はLICENSEか、https://opensource.org/licenses/mit-license.php を参照してください。
Shader "arktoon+T/Stencil/WriterMask/Cutout" {
    Properties {
        // Transform UV
        [ATSToggle]_UseTransformUV ("[UV Transform Ch1] Use Transform", Int ) = 0
        [ATSToggle]_UseTransformUVScroll ("[UV Transform Ch1] Use Scroll", Int ) = 0
        _TransformUVScrollMap ("[UV Transform Ch1] Scroll Map", 2D ) = "black" {}
        _TransformUVScrollSpeedMap ("[UV Transform Ch1] Scroll Speed Map", 2D ) = "black" {}
        _TransformUVScrollSpeed ("[UV Transform Ch1] Scroll Speed", Float ) = 0
        [ATSToggle]_UseTransformUVRotate ("[UV Transform Ch1] Use Rotate", Int ) = 0
        _TransformUVRotateMap ("[UV Transform Ch1] Rotate Map", 2D ) = "black" {}
        _TransformUVRotateSpeedMap ("[UV Transform Ch1] Rotate Speed Map", 2D ) = "black" {}
        _TransformUVRotateSpeed ("[UV Transform Ch1] Scroll Speed", Float ) = 0
        [ATSToggle]_UseTransformUV2 ("[UV Transform Ch2] Use Transform", Int ) = 0
        [ATSToggle]_UseTransformUV2Scroll ("[UV Transform Ch2] Use Scroll", Int ) = 0
        _TransformUV2ScrollMap ("[UV Transform Ch2] Scroll Map", 2D ) = "black" {}
        _TransformUV2ScrollSpeedMap ("[UV Transform Ch2] Scroll Speed Map", 2D ) = "black" {}
        _TransformUV2ScrollSpeed ("[UV Transform Ch2] Scroll Speed", Float ) = 0
        [ATSToggle]_UseTransformUV2Rotate ("[UV Transform Ch2] Use Rotate", Int ) = 0
        _TransformUV2RotateMap ("[UV Transform Ch2] Rotate Map", 2D ) = "black" {}
        _TransformUV2RotateSpeedMap ("[UV Transform Ch2] Rotate Speed Map", 2D ) = "black" {}
        _TransformUV2RotateSpeed ("[UV Transform Ch2] Scroll Speed", Float ) = 0
        // Double Sided
        [ATSToggle]_UseDoubleSided ("Double Sided", Int ) = 0
        [ATSToggle]_DoubleSidedFlipBackfaceNormal ("Flip backface normal", Float ) = 0
        _DoubleSidedBackfaceLightIntensity ("Backface Light intensity", Range(0, 2) ) = 0.5
        [ATSToggle]_DoubleSidedBackfaceUseColorShift("Backface Use Color Shift", Int) = 0
        [PowerSlider(2.0)]_DoubleSidedBackfaceHueShiftFromBase("Backface Hue Shift From Base", Range(-0.5, 0.5)) = 0
        _DoubleSidedBackfaceSaturationFromBase("Backface Saturation From Base", Range(0, 2)) = 1
        _DoubleSidedBackfaceValueFromBase("Backface Value From Base", Range(0, 2)) = 1
        //
        _ShadowCasterCulling("[hidden] Shadow Caster Culling", Int) = 2 // None:0, Front:1, Back:2
        // Common
        _MainTex ("[Common] Base Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_MainTexUV("[Common] Base Texture UV", Int) = 0
        _Color ("[Common] Base Color", Color) = (1,1,1,1)
        _BumpMap ("[Common] Normal map", 2D) = "bump" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_BumpMapUV("[Common] Normal map UV", Int) = 0
        _BumpScale ("[Common] Normal scale", Range(0,2)) = 1
        _EmissionMap ("[Common] Emission map", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_EmissionMapUV("[Common] Emission map UV", Int) = 0
        [HDR]_EmissionColor ("[Common] Emission Color", Color) = (0,0,0,1)
        _Emission2Map ("[Common] Emission2 map", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_Emission2MapUV("[Common] Emission2 map UV", Int) = 0
        [HDR]_Emission2Color ("[Common] Emission2 Color", Color) = (0,0,0,1)
        _LightColorSaturation ("[Common] Light Color Saturation", Range(0,1)) = 1
        _LightColorSaturationMask ("[Common] Light Color Saturation Mask", 2D ) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_LightColorSaturationMaskUV("[Common] Light Color Saturation Mask UV", Int) = 0
        // Emission Parallax
        [ATSToggle]_UseEmissionParallax ("[Emission Parallax] Use Emission Parallax", Int ) = 0
        _EmissionParallaxTex ("[Emission Parallax] Texture", 2D ) = "black" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_EmissionParallaxTexUV("[Emission Parallax] Texture UV", Int) = 0
        [HDR]_EmissionParallaxColor ("[Emission Parallax] Color", Color ) = (1,1,1,1)
        _EmissionParallaxMask ("[Emission Parallax] Emission Mask", 2D ) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_EmissionParallaxMaskUV("[Emission Parallax] Emission Mask UV", Int) = 0
        _EmissionParallaxDepth ("[Emission Parallax] Depth", Range(-1, 1) ) = 0
        _EmissionParallaxDepthMask ("[Emission Parallax] Depth Mask", 2D ) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_EmissionParallaxDepthMaskUV("[Emission Parallax] Depth Mask UV", Int) = 0
        [ATSToggle]_EmissionParallaxDepthMaskInvert ("[Emission Parallax] Invert Depth Mask", Float ) = 0
        // Cutout
        _CutoutCutoutAdjust ("Cutout Border Adjust", Range(0, 1)) = 0.5
        // Shadow (received from DirectionalLight, other Indirect(baked) Lights, including SH)
        _Shadowborder ("[Shadow] border ", Range(0, 1)) = 0.6
        _ShadowborderBlur ("[Shadow] border Blur", Range(0, 1)) = 0.05
        _ShadowborderBlurMask ("[Shadow] border Blur Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowborderBlurMaskUV("[Shadow] border Blur Mask UV", Int) = 0
        _ShadowStrength ("[Shadow] Strength", Range(0, 1)) = 0.5
        _ShadowStrengthMask ("[Shadow] Strength Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowStrengthMaskUV("[Shadow] Strength Mask UV", Int) = 0
        _ShadowIndirectIntensity ("[Shadow] Indirect face Intensity", Range(0,0.5)) = 0.25
        // Shadow steps
        [ATSToggle]_ShadowUseStep ("[Shadow] use step", Float ) = 0
        _ShadowSteps("[Shadow] steps between borders", Range(2, 10)) = 4
        // PointShadow (received from Point/Spot Lights as Pixel/Vertex Lights)
        _PointAddIntensity ("[PointShadow] Light Intensity", Range(0,1)) = 1
        _PointShadowStrength ("[PointShadow] Strength", Range(0, 1)) = 0.5
        _PointShadowborder ("[PointShadow] border ", Range(0, 1)) = 0.5
        _PointShadowborderBlur ("[PointShadow] border Blur", Range(0, 1)) = 0.01
        _PointShadowborderBlurMask ("[PointShadow] border Blur Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_PointShadowborderBlurMaskUV("[PointShadow] border Blur Mask UV", Int) = 0
        [ATSToggle]_PointShadowUseStep ("[PointShadow] use step", Float ) = 0
        _PointShadowSteps("[PointShadow] steps between borders", Range(2, 10)) = 2
        // Plan B
        [ATSToggle]_ShadowPlanBUsePlanB ("[Plan B] Use Plan B", Int ) = 0
        _ShadowPlanBDefaultShadowMix ("[Plan B] Shadow mix", Range(0, 1)) = 1
        [ATSToggle] _ShadowPlanBUseCustomShadowTexture ("[Plan B] Use Custom Shadow Texture", Int ) = 0
        [PowerSlider(2.0)]_ShadowPlanBHueShiftFromBase ("[Plan B] Hue Shift From Base", Range(-0.5, 0.5)) = 0
        _ShadowPlanBSaturationFromBase ("[Plan B] Saturation From Base", Range(0, 2)) = 1
        _ShadowPlanBValueFromBase ("[Plan B] Value From Base", Range(0, 2)) = 1
        _ShadowPlanBCustomShadowTexture ("[Plan B] Custom Shadow Texture", 2D) = "black" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowPlanBCustomShadowTextureUV("[Plan B] Custom Shadow Texture UV", Int) = 0
        _ShadowPlanBCustomShadowTextureRGB ("[Plan B] Custom Shadow Texture RGB", Color) = (1,1,1,1)
        // ShadowPlanB-2
        [ATSToggle]_CustomShadow2nd ("[Plan B-2] CustomShadow2nd", Int ) = 0
        _ShadowPlanB2border ("[Plan B-2] border ", Range(0, 1)) = 0.55
        _ShadowPlanB2borderBlur ("[Plan B-2] border Blur", Range(0, 1)) = 0.55
        [ATSToggle] _ShadowPlanB2UseCustomShadowTexture ("[Plan B-2] Use Custom Shadow Texture", Int ) = 0
        [PowerSlider(2.0)]_ShadowPlanB2HueShiftFromBase ("[Plan B-2] Hue Shift From Base", Range(-0.5, 0.5)) = 0
        _ShadowPlanB2SaturationFromBase ("[Plan B-2] Saturation From Base", Range(0, 2)) = 1
        _ShadowPlanB2ValueFromBase ("[Plan B-2] Value From Base", Range(0, 2)) = 1
        _ShadowPlanB2CustomShadowTexture ("[Plan B-2] Custom Shadow Texture", 2D) = "black" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowPlanB2CustomShadowTextureUV("[Plan B-2] Custom Shadow Texture UV", Int) = 0
        _ShadowPlanB2CustomShadowTextureRGB ("[Plan B-2] Custom Shadow Texture RGB", Color) = (1,1,1,1)
        // Gloss
        [ATSToggle]_UseGloss ("[Gloss] Enabled", Int) = 0
        _GlossColor ("[Gloss] Gloss Color", Color) = (1,1,1,1)
        _GlossTexture ("[Gloss] Gloss Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_GlossTextureUV("[Gloss] Gloss Texture UV", Int) = 0
        _GlossBlend ("[Gloss] Smoothness", Range(0, 1)) = 0.5
        _GlossBlendMask ("[Gloss] Smoothness Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_GlossBlendMaskUV("[Gloss] Smoothness Mask UV", Int) = 0
        _GlossPower ("[Gloss] Metallic", Range(0, 1)) = 0.5
        _GlossPowerMask ("[Gloss] Metallic Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_GlossPowerMaskUV("[Gloss] Metallic Mask UV", Int) = 0
        // Outline
        [ATSToggle]_UseOutline ("[Outline] Enabled", Int) = 0
        _OutlineWidth ("[Outline] Width", Range(0, 20)) = 0.1
        _OutlineMask ("[Outline] Outline Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_OutlineMaskUV("[Outline] Outline Mask UV", Int) = 0
        _OutlineCutoffRange ("[Outline] Cutoff Range", Range(0, 1)) = 0.5
        _OutlineColor ("[Outline] Color", Color) = (0,0,0,1)
        _OutlineTexture ("[Outline] Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_OutlineTextureUV("[Outline] Texture UV", Int) = 0
        _OutlineShadeMix ("[Outline] Shade Mix", Range(0, 1)) = 0
        _OutlineTextureColorRate ("[Outline] Texture Color Rate", Range(0, 1)) = 0.05
        _OutlineWidthMask ("[Outline] Outline Width Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_OutlineWidthMaskUV("[Outline] Outline Width Mask UV", Int) = 0
        [ATSToggle]_OutlineUseColorShift("[Outline] Use Outline Color Shift", Int) = 0
        [PowerSlider(2.0)]_OutlineHueShiftFromBase("[Outline] Hue Shift From Base", Range(-0.5, 0.5)) = 0
        _OutlineSaturationFromBase("[Outline] Saturation From Base", Range(0, 2)) = 1
        _OutlineValueFromBase("[Outline] Value From Base", Range(0, 2)) = 1
        // MatCap
        [Enum(Add,0, Lighten,1, Screen,2, Unused,3)] _MatcapBlendMode ("[MatCap] Blend Mode", Int) = 3
        _MatcapBlend ("[MatCap] Blend", Range(0, 3)) = 1
        _MatcapBlendMask ("[MatCap] Blend Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_MatcapBlendMaskUV("[MatCap] Blend Mask UV", Int) = 0
        _MatcapNormalMix ("[MatCap] Normal map mix", Range(0, 2)) = 1
        _MatcapShadeMix ("[MatCap] Shade Mix", Range(0, 1)) = 0
        _MatcapTexture ("[MatCap] Texture", 2D) = "black" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_MatcapTextureUV("[MatCap] Texture UV", Int) = 0
        _MatcapColor ("[MatCap] Color", Color) = (1,1,1,1)
        // Reflection
        [ATSToggle]_UseReflection ("[Reflection] Enabled", Int) = 0
        [ATSToggle]_UseReflectionProbe ("[Reflection] Use Reflection Probe", Int) = 1
        _ReflectionColor ("[Reflection] Reflection Color", Color) = (1,1,1,1)
        _ReflectionTexture ("[Reflection] Reflection Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ReflectionTextureUV("[Reflection] Reflection Texture UV", Int) = 0
        _ReflectionReflectionPower ("[Reflection] Reflection Power", Range(0, 1)) = 1
        _ReflectionReflectionMask ("[Reflection] Reflection Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ReflectionReflectionMaskUV("[Reflection] Reflection Mask UV", Int) = 0
        _ReflectionNormalMix ("[Reflection] Normal Map Mix", Range(0,2)) = 1
        _ReflectionShadeMix ("[Reflection] Shade Mix", Range(0, 1)) = 0
        _ReflectionSuppressBaseColorValue ("[Reflection] Suppress Base Color", Range(0, 1)) = 1
        _ReflectionCubemap ("[Reflection] Cubemap", Cube) = "" {}
        // Rim
        [ATSToggle]_UseRim ("[Rim] Enabled", Int) = 0
        _RimBlend ("[Rim] Blend", Range(0, 3)) = 1
        _RimBlendMask ("[Rim] Blend Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_RimBlendMaskUV("[Rim] Blend Mask UV", Int) = 0
        _RimShadeMix("[Rim] Shade Mix", Range(0, 1)) = 0
        [PowerSlider(3.0)]_RimFresnelPower ("[Rim] Fresnel Power", Range(0, 200)) = 1
        _RimUpperSideWidth("[Rim] Upper width", Range(0, 1)) = 0
        [HDR]_RimColor ("[Rim] Color", Color) = (1,1,1,1)
        _RimTexture ("[Rim] Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_RimTextureUV("[Rim] Texture UV", Int) = 0
        [ATSToggle] _RimUseBaseTexture ("[Rim] Use Base Texture", Float ) = 0
        // ShadowCap
        [Enum(Darken,0, Multiply,1, Light Shutter,2, Unused,3)] _ShadowCapBlendMode ("[ShadowCap] Blend Mode", Int) = 3
        _ShadowCapBlend ("[ShadowCap] Blend", Range(0, 3)) = 1
        _ShadowCapBlendMask ("[ShadowCap] Blend Mask", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowCapBlendMaskUV("[ShadowCap] Blend Mask UV", Int) = 0
        _ShadowCapNormalMix ("[ShadowCap] Normal map mix", Range(0, 2)) = 1
        _ShadowCapTexture ("[ShadowCap] Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_ShadowCapTextureUV("[ShadowCap] Texture UV", Int) = 0
        // Stencil(Writer)
        _StencilNumber ("[StencilWriter] Number", int) = 5
        _StencilMaskTex ("[StencilWriter] Mask Texture", 2D) = "white" {}
        [Enum(Default,0, Channel1,1, Channel2,2)]_StencilMaskTexUV("[StencilWriter] Mask Texture UV", Int) = 0
        _StencilMaskAdjust ("[StencilWriter] Mask Texture Adjust", Range(0, 1)) = 0.5
        _StencilMaskAlphaDither ("[StencilWriter] StencilAlpha(Dither)", Range(0, 1)) = 1.0
        // vertex color blend
        _VertexColorBlendDiffuse ("[VertexColor] Blend to diffuse", Range(0,1)) = 0
        _VertexColorBlendEmissive ("[VertexColor] Blend to emissive", Range(0,1)) = 0
        // advanced tweaking
        _OtherShadowAdjust ("[Advanced] Other Mesh Shadow Adjust", Range(-0.2, 0.2)) = -0.1
        _OtherShadowBorderSharpness ("[Advanced] Other Mesh Shadow Border Sharpness", Range(1, 5)) = 3
        // Per-vertex light switching
        [ATSToggle]_UseVertexLight("[Advanced] Use Per-vertex Lighting", Int) = 1
        // Light Sampling
        [Enum(Arktoon,0, Cubed,1)]_LightSampling("[Light] Sampling Style", Int) = 0
        // Legacy MatCap/ShadeCap Calculation
        [ATSToggle]_UsePositionRelatedCalc ("[Mat/ShadowCap] Use Position Related Calc (Experimental)", Int) = 0
        // Version
        [HideInInspector]_Version("[hidden] Version", int) = 0
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType" = "TransparentCutout"
        }
        Pass {
            Name "STENCIL_WRITER"
            Tags {
            }
            Cull Back

            Stencil {
                Ref [_StencilNumber]
                Comp Always
                Pass Replace
            }

            CGPROGRAM

            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma only_renderers d3d9 d3d11 glcore gles
            #pragma target 4.0
            #define ARKTOON_CUTOUT

            #include "cginc/arkludeDecl.cginc"
            #include "cginc/arkludeOther.cginc"
            #include "cginc/arkludeVertGeom.cginc"
            #include "cginc/arkludeFragOnlyStencilWrite.cginc"
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Back

            CGPROGRAM


            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles
            #pragma target 4.0
            #define ARKTOON_CUTOUT

            #include "cginc/arkludeDecl.cginc"
            #include "cginc/arkludeOther.cginc"
            #include "cginc/arkludeVertGeom.cginc"
            #include "cginc/arkludeFrag.cginc"
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Cull Back
            Blend One One

            CGPROGRAM

            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles
            #pragma target 4.0
            #define ARKTOON_CUTOUT
            #define ARKTOON_ADD

            #include "cginc/arkludeDecl.cginc"
            #include "cginc/arkludeOther.cginc"
            #include "cginc/arkludeVertGeom.cginc"
            #include "cginc/arkludeAdd.cginc"
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull [_ShadowCasterCulling]

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles
            #pragma target 4.0
            uniform float _CutoutCutoutAdjust;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip((_MainTex_var.a * _Color.a) - _CutoutCutoutAdjust);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Standard"
    CustomEditor "ArktoonPlusTShaders.ArktoonInspector"
}
