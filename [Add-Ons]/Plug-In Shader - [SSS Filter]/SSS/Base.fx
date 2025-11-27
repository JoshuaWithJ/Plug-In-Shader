//////////////////////////////////////////////////////////////////////////////////////
//
// - Plug-In Shader - by Joshua: SSS Sampler
// Base Shader: Simple Soft Shader by BeanManP
//
//////////////////////////////////////////////////////////////////////////////////////
// Shader Type
//TYPE 0 = Simple Soft Shader
//TYPE 1 = Half Lambert shader (EDITED)

#define SHADER_TYPE 1
//////////////////////////////////////////////////////////////////////////////////////
// Shadow Color
float4 Shadow_Color = float4(1,1,1,1.0);

// Soft Shadow Blur
float SoftShadowParam = 0.5;

// Shadow Size
#define SHADOWMAP_SIZE 1024

// Shadow Affecting Specular Reflection
#define SHADOW_AFFECT_SPECULAR_REFLECTIONS 0

float Reflection_Shadow_Effect_Intensity = 1.0;

// Toon
float Toon_Gradient = 1.0;
float Toon_Smooth = 2.0;
float Toon_Intensity = 0.75;

//////////////////////////////////////////////////////////////////////////////////////
// IBL

#define APPLY_IBL 0
#define APPLY_IBL_LIGHT_DIRECTION 1
#define APPLY_IBL_LIGHT_AMBIENT 0

// IBL TEXTURE
#define IBL_Texture "IBL/IBL.dds";

float IBL_Intensity = 0.0;
float IBL_Shadow_Intensity = 0.0;
float IBL_Brightness = 1.0;

//////////////////////////////////////////////////////////////////////////////////////
// Blend Type
//TYPE 0 = ZERO
//TYPE 1 = ONE
//TYPE 2 = SrcColor
//TYPE 3 = INVSrcColor
//TYPE 4 = SrcAlpha
//TYPE 5 = INVSrcAlpha
//TYPE 6 = DestAlpha
//TYPE 7 = INVDestAlpha
//TYPE 8 = DestColor
//TYPE 9 = INVDestColor

#define BLEND_APPLY 1

#define SRC_BLEND_TYPE	4
#define DEST_BLEND_TYPE	5

///////////////////////////////////////////////
// Blend APPLY Type
//TYPE 0 = NONE
//TYPE 1 = FALSE
//TYPE 2 = TRUE

#define ALPHA_BLEND_APPLY	0
#define ALPHA_TEST_APPLY	0

#define ALPHA_BLEND_TYPE	0
#define ALPHA_TEST_TYPE		0

#define Z_WRITE_APPLY		0
#define Z_APPLY				0

#define Z_WRITE_TYPE		0
#define Z_TYPE				0

///////////////////////////////////////////////
// CullMode
//TYPE 0 = NONE
//TYPE 1 = CW
//TYPE 2 = CCW

#define CULLMODE_APPLY		0

#define CULLMODE_TYPE		0
//////////////////////////////////////////////////////////////////////////////////////
//Samplers

// Object Texture
texture ObjectTexture: MATERIALTEXTURE;
sampler ObjTexSampler = sampler_state {
    texture = <ObjectTexture>;
    FILTER= ANISOTROPIC;
    AddressU  = WRAP;
    AddressV  = WRAP;
};

#define IBLRT_Control  "IBL.x"
bool IBLRT_Valid  : CONTROLOBJECT < string name = IBLRT_Control; >;

//IBL RT
shared texture2D IBLRT : RENDERCOLORTARGET;
sampler2D IBLRT_Samp = sampler_state {
    texture = <IBLRT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

//Specular RT
shared texture2D SpecularRT : RENDERCOLORTARGET;
sampler2D SpecularRT_Samp = sampler_state {
    texture = <SpecularRT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

//Irradiance RT
shared texture2D IrradianceRT : RENDERCOLORTARGET;
sampler2D IrradianceRT_Samp = sampler_state {
    texture = <IrradianceRT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

#if APPLY_IBL == 1
//IBL
textureCUBE IBLMap  <
    string ResourceName = IBL_Texture
    string Format = "A16B16G16R16F";>;
sampler IBLSampler = sampler_state {
    Texture = <IBLMap>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};
#if APPLY_IBL_SPECULAR == 1
//IBL 2
textureCUBE IBLMap2  <
    string ResourceName = IBL_Texture_2
    string Format = "A16B16G16R16F";>;
sampler IBLSampler2 = sampler_state {
    Texture = <IBLMap2>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 3
textureCUBE IBLMap3  <
    string ResourceName = IBL_Texture_3
    string Format = "A16B16G16R16F";>;
sampler IBLSampler3 = sampler_state {
    Texture = <IBLMap3>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};
#endif
#endif

#define PLRT_Control  "PointLight.x"
bool PLRT_Valid  : CONTROLOBJECT < string name = PLRT_Control; >;

shared texture2D PointLight : RENDERCOLORTARGET;
sampler2D PointLight_Samp = sampler_state {
    texture = <PointLight>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

////////////////////////////////////////////////////////////////////////////////////////////////
// Sequence of transformations
float4x4 WorldViewProjMatrix		: WORLDVIEWPROJECTION;
float4x4 WorldViewMatrix			: WORLDVIEW;
float4x4 WorldMatrix				: WORLD;
float4x4 ViewMatrix					: VIEW;
float4x4 LightWorldViewProjMatrix	: WORLDVIEWPROJECTION < string Object = "Light"; >;

// Light Color
float3   LightAmbient      : AMBIENT   < string Object = "Light"; >;
float3   LightDirection    : DIRECTION < string Object = "Light"; >;
float3   CameraPosition    : POSITION  < string Object = "Camera"; >;

float4	MaterialToon		: TOONCOLOR;

bool     parthf;   // Perspective flag
bool     transp;   // Semi-transparent flag
bool	 spadd;    // Sphere map additive composition flag

#define SKII1	1500
#define SKII2	8000
#define Toon	Toon_Gradient

//HG Shadow
#include "Resources/HgShadow_ObjHeader.fxh"

////////////////////////////////////////////////////////////////////////////////////////////////
float3	LightDiffuse			: DIFFUSE   < string Object = "Light"; >;
float4	MaterialDiffuse		: DIFFUSE  < string Object = "Geometry"; >;
static	float4 DiffuseColor		= MaterialDiffuse  * float4(LightDiffuse, 1.0f);
////////////////////////////////////////////////////////////////////////////////////////////////

sampler DefSampler : register(s0);

struct BufferShadow_INPUT {
    float4 Pos      : POSITION; // Position
    float3 Normal   : NORMAL; // Normal
	float2 UV : TEXCOORD0;
};

struct BufferShadow_OUTPUT {
	float4 Pos 		: POSITION;
    float3 Normal   : NORMAL; // Normal
	float2 UV : TEXCOORD0;
    float4 ZCalcTex : TEXCOORD5; // ZCalcTex
    float4 PPos		: TEXCOORD8; // Positon for HgShadow
};

///////////////////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
BufferShadow_OUTPUT BufferShadow_VS(BufferShadow_INPUT IN)
{
	BufferShadow_OUTPUT Out = (BufferShadow_OUTPUT)0;
	// UV
	Out.UV = IN.UV;
	
	// Vertex Normal
	Out.Normal = normalize( mul( IN.Normal, (float3x3)WorldMatrix ) );
	
	// Shadow Projection
	Out.ZCalcTex = mul( IN.Pos, LightWorldViewProjMatrix );
	
	// World view projective transformation from camera perspective
	Out.Pos = mul( IN.Pos, WorldViewProjMatrix );
	
	// HgShadow
	Out.PPos = Out.Pos;
	
	return Out;
}
//////////////////////////////////////////////////
float3x3 Set_Rotation(float3 in_axis, float s, float c)
{
    float c_1 = 1.0f - c;
	float3x3 in_m1 = 1;
    float3 axis = normalize(in_axis);
    float3 axis_s = axis * s;

    float3 temp;
    temp = axis * axis.x * c_1;
    in_m1[0].x = temp.x + c;
    in_m1[1].x = temp.y - axis_s.z;
    in_m1[2].x = temp.z + axis_s.y;
    temp = axis * axis.y * c_1;
    in_m1[0].y = temp.x + axis_s.z;
    in_m1[1].y = temp.y + c;
    in_m1[2].y = temp.z - axis_s.x;
    temp = axis * axis.z * c_1;
    in_m1[0].z = temp.x - axis_s.y;
    in_m1[1].z = temp.y + axis_s.x;
    in_m1[2].z = temp.z + c;
	return in_m1;
}
////////////////////////////////////////////////////////////////////////////////////////////////
//Noise
	float rand(float2 co) {
    return frac(sin(dot(co * 16, float2(12.9898, 78.233))) * 43758.5453);
}
///////////////////////////////////////////////////////////////////////////////////////////////
// Pixel Shader
float4 BufferShadow_PS(BufferShadow_OUTPUT IN) : COLOR
{
//////////////////////////////////////////////////
// Inputs
//////////////////////////////////////////////////
	float3 Normal		= normalize(IN.Normal);
//////////////////////////////////////////////////
    float4 Color		= 1;
	float4 TexColor		= tex2D( ObjTexSampler, IN.UV );
    float4 ShadowColor	= Shadow_Color;

//////////////////////////////////////////////////
	
	float3x3 RotationTransform;

	float length1 = length(LightDirection.xyz * float3(-1, 1, -1));
    if (length1 >= 0.000001f) {
        float3 cube_direction = (LightDirection.xyz * float3(-1, 1, -1)) * (1.0f / length1);

		float3 Posi = float3(0, 1, 0);
        length1 = length(Posi.xyz);
        if (length1 >= 0.000001f) {
            float3 position = Posi * (1.0f / length1);
		
			float3 axis = cross(cube_direction, position);
            length1 = length(axis.xyz);

            float v52 = dot(cube_direction, position);
            float angle = abs(atan2(length1, v52));
			
			if (angle >= 0.01f && angle <= 3.131592653589793f) {
                if (length1 != 0.0f)
                    axis *= 1.0f / length1;
				
			RotationTransform =  Set_Rotation(axis, sin(-angle), cos(-angle));
			}
		}
	}

//////////////////////////////////////////////////
//Shadow
//////////////////////////////////////////////////
    // Convert to texture coordinates
    IN.ZCalcTex /= IN.ZCalcTex.w;
    float2 TransTexCoord;
    TransTexCoord.x = (1.0f + IN.ZCalcTex.x)*0.5f;
    TransTexCoord.y = (1.0f - IN.ZCalcTex.y)*0.5f;
    
		if( any( saturate(TransTexCoord) != TransTexCoord ) ) {
        return Color;
		} else {
        float ShadowComp = 0;
		float U = SoftShadowParam / SHADOWMAP_SIZE;
		float V = SoftShadowParam / SHADOWMAP_SIZE;
        if(parthf) {
            // セルフシャドウ mode2
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,0)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,0)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,0)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,-V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,-V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,-V)).r , 0.0f)*SKII2*TransTexCoord.y-0.3f);
        } else {
            // セルフシャドウ mode1
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,0)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,0)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,0)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,V)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(0,-V)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,V)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,V)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(-U,-V)).r , 0.0f)*SKII1-0.3f);
	        ShadowComp += saturate(max(IN.ZCalcTex.z-tex2D(DefSampler,TransTexCoord+float2(U,-V)).r , 0.0f)*SKII1-0.3f);
        }
		float LightNormal = dot(-LightDirection, lerp(IN.Normal,Normal, 0.5) );
		LightNormal = smoothstep(0.5 - Toon_Smooth * 0.5, 0.5 + Toon_Smooth * 0.5, LightNormal);
		
        ShadowComp = 1-saturate(ShadowComp/9);
		ShadowComp = min(saturate(LightNormal * Toon), ShadowComp);

//////////////////////////////////////////////////
	if(HgShadow_Valid)
	{
        float comp = HgShadow_GetSelfShadowRate(IN.PPos);
         comp = min(saturate(LightNormal * Toon), comp);
	     ShadowComp = comp;
	}

//////////////////////////////////////////////////
// IBL
	if(IBLRT_Valid)
	{
	
	float2 texCoord = float2( ( IN.PPos.x/IN.PPos.w + 1.0f ) * 0.5f, 1.0f - ( IN.PPos.y/IN.PPos.w + 1.0f ) * 0.5f ) + 2;
	
	float4 IBL = tex2Dlod(IBLRT_Samp, float4(texCoord.xy, 0, 1)) * 0.5 * IBL_Brightness;
	float4 IBL1 = tex2Dlod(IBLRT_Samp, float4(texCoord.xy, 0, 1)) * 0.5;
	
	#if APPLY_IBL_LIGHT_AMBIENT == 1
	
	IBL.rgb *= LightAmbient.rgb + 0.5;
	
	#endif
	
	float3 IBL_B		= pow( max(0,dot( (LightDirection * float3 (1.0,-1.0,1.0)), Normal )), 1 );
	IBL1.rgb *= IBL_B.rgb;
	
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL.rgb, 0.25 * IBL_Intensity);
	ShadowColor.rgb = lerp(ShadowColor.rgb, ShadowColor.rgb + IBL1,0.2);
	
	
	} else {
	//////////////////////////////////////////////////
	#if APPLY_IBL == 1
	
	#if APPLY_IBL_LIGHT_DIRECTION == 0
	float3 IBLPos = Normal * float3(1,1,-1);
	#endif
	
	#if APPLY_IBL_LIGHT_DIRECTION == 1
    float IBLrot_x = radians(22.5);
    float IBLrot_y = radians(-22.5);
    float IBLrot_z = radians(45);
	float3x3 IBLRotationX = {
	    {1,	0,	0},
	    {0, cos(IBLrot_x), sin(IBLrot_x)},
	    {0, -sin(IBLrot_x), cos(IBLrot_x)},
	};
	float3x3 IBLRotationY = {
	    {cos(IBLrot_y), 0, -sin(IBLrot_y)},
	    {0, 1, 0},
		{sin(IBLrot_y), 0,cos(IBLrot_y)},
	    };
	float3x3 IBLRotationZ = {
	    {cos(IBLrot_z), sin(IBLrot_z), 0},
	    {-sin(IBLrot_z), cos(IBLrot_z), 0},
	    {0, 0, 1},
	};
	float3x3 IBLRot = RotationTransform;
    IBLRot = mul( IBLRot, IBLRotationX );
    IBLRot = mul( IBLRot, IBLRotationY );
    IBLRot = mul( IBLRot, IBLRotationZ );
	float3 IBLPos = mul(Normal* float3(1,1,-1), (float3x3)IBLRot);
	#endif
	
	float4 IBL = texCUBElod(IBLSampler, float4( IBLPos, 0)) * 0.5 * IBL_Brightness;
	float4 IBL1 = texCUBElod(IBLSampler, float4( IBLPos, 0)) * 1.25;
	
	#if APPLY_IBL_LIGHT_AMBIENT == 1
	
	IBL.rgb *= LightAmbient.rgb + 0.5;
	
	#endif
	
	float3 IBL_B		= pow( max(0,dot( (LightDirection * float3 (1.0,-1.0,1.0)), Normal )), 1 );
	IBL1.rgb *= IBL_B.rgb;
	
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL.rgb, 0.25 * IBL_Intensity);
	ShadowColor.rgb = lerp(ShadowColor.rgb, ShadowColor.rgb + IBL1,IBL_Intensity);
	
	#endif
	//////////////////////////////////////////////////
	}
//////////////////////////////////////////////////

// Point Light

	if(PLRT_Valid){
	
	float2 texCoord = float2( ( IN.PPos.x/IN.PPos.w + 1.0f ) * 0.5f, 1.0f - ( IN.PPos.y/IN.PPos.w + 1.0f ) * 0.5f ) + 2;
	float4 PointLight = tex2Dlod(PointLight_Samp, float4(texCoord.xy, 0, 1));

	
	ShadowColor.rgb += PointLight;
	ShadowColor.rgb = clamp (ShadowColor, 0,1);

	}
//////////////////////////////////////////////////

	#if SHADER_TYPE == 1
	float3 HalfLambert = min(pow(dot(Normal, -LightDirection) * 0.5 + 0.5, 2) * 0.5 + 0.5, (1,1,ShadowComp));
	HalfLambert = pow(HalfLambert * 0.5 + 0.5, 1.0) * (HalfLambert.rgb = pow(HalfLambert, ShadowColor * HalfLambert * 0.5 + 0.5));
	
	ShadowComp = HalfLambert;
	#endif

//////////////////////////////////////////////////
	
	ShadowColor.rgb *= Toon_Intensity;
	
	Color.rgb  = lerp(Color.rgb * ShadowColor.rgb, Color.rgb, ShadowComp);
	
	DiffuseColor.a = clamp(DiffuseColor.a, 0.0f, 1.0f);
	Color.a *= TexColor.a;
	Color.a *= DiffuseColor.a;
	
	float3 noise = rand(IN.UV);
    if (Color.a < noise.r) discard;
	
	clip(Color.a < 0.5 ? -1:1);

//////////////////////////////////////////////////
        return Color;
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////
// Techniques
technique PGTech  < string MMDPass = "object_ss"; > {
    pass DrawObject {
		#if BLEND_APPLY == 1
		
		#if SRC_BLEND_TYPE == 0
		SRCBLEND = ZERO;
		#endif
		#if SRC_BLEND_TYPE == 1
		SRCBLEND = ONE;
		#endif
		#if SRC_BLEND_TYPE == 2
		SRCBLEND = SrcColor;
		#endif
		#if SRC_BLEND_TYPE == 3
		SRCBLEND = INVSrcColor;
		#endif
		#if SRC_BLEND_TYPE == 4
		SRCBLEND = SrcAlpha;
		#endif
		#if SRC_BLEND_TYPE == 5
		SRCBLEND = INVSrcAlpha;
		#endif
		#if SRC_BLEND_TYPE == 6
		SRCBLEND = DestAlpha;
		#endif
		#if SRC_BLEND_TYPE == 7
		SRCBLEND = INVDestAlpha;
		#endif
		#if SRC_BLEND_TYPE == 8
		SRCBLEND = DestColor;
		#endif
		#if SRC_BLEND_TYPE == 9
		SRCBLEND = INVDestColor;
		#endif

		#if DEST_BLEND_TYPE == 0
		DESTBLEND = ZERO;
		#endif
		#if DEST_BLEND_TYPE == 1
		DESTBLEND = ONE;
		#endif
		#if DEST_BLEND_TYPE == 2
		DESTBLEND = SrcColor;
		#endif
		#if DEST_BLEND_TYPE == 3
		DESTBLEND = INVSrcColor;
		#endif
		#if DEST_BLEND_TYPE == 4
		DESTBLEND = SrcAlpha;
		#endif
		#if DEST_BLEND_TYPE == 5
		DESTBLEND = INVSrcAlpha;
		#endif
		#if DEST_BLEND_TYPE == 6
		DESTBLEND = DestAlpha;
		#endif
		#if DEST_BLEND_TYPE == 7
		DESTBLEND = INVDestAlpha;
		#endif
		#if DEST_BLEND_TYPE == 8
		DESTBLEND = DestColor;
		#endif
		#if DEST_BLEND_TYPE == 9
		DESTBLEND = INVDestColor;
		#endif
		
		#endif

		#if ALPHA_BLEND_APPLY == 1
		
		#if ALPHA_BLEND_TYPE == 1
		ALPHABLENDENABLE = FALSE;
		#endif
		
		#if ALPHA_BLEND_TYPE == 2
		ALPHABLENDENABLE = TRUE;
		#endif
		
		#endif
		
		#if ALPHA_TEST_APPLY == 1
		
		#if ALPHA_TEST_TYPE == 1
		ALPHATESTENABLE = FALSE;
		#endif

		#if ALPHA_TEST_TYPE == 2
		ALPHATESTENABLE = TRUE;
		#endif

		#endif
		
		#if Z_WRITE_APPLY == 1
		
		#if Z_WRITE_TYPE == 1
		ZWRITEENABLE = FALSE;
		#endif
		
		#if Z_WRITE_TYPE == 2
		ZWRITEENABLE = TRUE;
		#endif
		
		#endif
		
		#if Z_ENABLE_APPLY == 1
		
		#if Z_TYPE == 1
		ZENABLE = FALSE;
		#endif
		
		#if Z_TYPE == 2
		ZENABLE = TRUE;
		#endif
		
		#endif
		
		#if CULLMODE_APPLY == 1
		
		#if CULLMODE_TYPE == 0
		CULLMODE = NONE;
		#endif
		
		#if CULLMODE_TYPE == 1
		CULLMODE = CW;
		#endif
		
		#if CULLMODE_TYPE == 2
		CULLMODE = CCW;
		#endif
		
		#endif
        VertexShader = compile vs_3_0 BufferShadow_VS();
        PixelShader  = compile ps_3_0 BufferShadow_PS();
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////