////////////////////////////////////////////////////////////////////////////////////////////////
//
//
// - Plug-In Shader RT Sampler - by Joshua
// Base Shader: Simple Soft Shader by BeanManP
// 
//
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

//Irradiance
textureCUBE Irradiance  <
    string ResourceName = "Irradiance/Irradiance.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler = sampler_state {
    Texture = <Irradiance>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 1
textureCUBE Irradiance1  <
    string ResourceName = "Irradiance/Irradiance1.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler1 = sampler_state {
    Texture = <Irradiance1>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 2
textureCUBE Irradiance2  <
    string ResourceName = "Irradiance/Irradiance2.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler2 = sampler_state {
    Texture = <Irradiance2>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 3
textureCUBE Irradiance3  <
    string ResourceName = "Irradiance/Irradiance3.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler3 = sampler_state {
    Texture = <Irradiance3>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 4
textureCUBE Irradiance4  <
    string ResourceName = "Irradiance/Irradiance4.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler4 = sampler_state {
    Texture = <Irradiance4>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 5
textureCUBE Irradiance5  <
    string ResourceName = "Irradiance/Irradiance5.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler5 = sampler_state {
    Texture = <Irradiance5>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 6
textureCUBE Irradiance6  <
    string ResourceName = "Irradiance/Irradiance6.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler6 = sampler_state {
    Texture = <Irradiance6>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 7
textureCUBE Irradiance7  <
    string ResourceName = "Irradiance/Irradiance7.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler7 = sampler_state {
    Texture = <Irradiance7>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 8
textureCUBE Irradiance8  <
    string ResourceName = "Irradiance/Irradiance8.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler8 = sampler_state {
    Texture = <Irradiance8>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 9
textureCUBE Irradiance9  <
    string ResourceName = "Irradiance/Irradiance9.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler9 = sampler_state {
    Texture = <Irradiance9>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 10
textureCUBE Irradiance10  <
    string ResourceName = "Irradiance/Irradiance10.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler10 = sampler_state {
    Texture = <Irradiance10>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 11
textureCUBE Irradiance11  <
    string ResourceName = "Irradiance/Irradiance12.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler11 = sampler_state {
    Texture = <Irradiance11>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 12
textureCUBE Irradiance12  <
    string ResourceName = "Irradiance/Irradiance.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler12 = sampler_state {
    Texture = <Irradiance12>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Irradiance 13
textureCUBE Irradiance13  <
    string ResourceName = "Irradiance/Irradiance13.dds";
    string Format = "A16B16G16R16F";>;
sampler IrradianceSampler13 = sampler_state {
    Texture = <Irradiance13>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

texture ObjectTexture: MATERIALTEXTURE;
sampler ObjTexSampler = sampler_state {
    texture = <ObjectTexture>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};
////////////////////////////////////////////////////////////////////////////////////////////////
float3	LightDiffuse			: DIFFUSE   < string Object = "Light"; >;
float4	MaterialDiffuse		: DIFFUSE  < string Object = "Geometry"; >;
static	float4 DiffuseColor		= MaterialDiffuse  * float4(LightDiffuse, 1.0f);
////////////////////////////////////////////////////////////////////////////////////////////////
// Sequence of transformations
float4x4 WorldViewProjMatrix		: WORLDVIEWPROJECTION;
float4x4 WorldViewMatrix			: WORLDVIEW;
float4x4 WorldMatrix				: WORLD;
float4x4 ViewMatrix					: VIEW;
float4x4 LightWorldViewProjMatrix	: WORLDVIEWPROJECTION < string Object = "Light"; >;

float3   LightDirection    : DIRECTION < string Object = "Light"; >;
float3   CameraPosition    : POSITION  < string Object = "Camera"; >;

bool     parthf;   // Perspective flag
bool     transp;   // Semi-transparent flag
bool	 spadd;    // Sphere map additive composition flag

////////////////////////////////////////////////////////////////////////////////////////////////
//Controller
float4x4 IBLC : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL_ROT"; >;
static float3 IBLR = -IBLC._31_32_33;

//ToneMap Controller 
#define CONTROLLER_NAME	"IBL RT - Controller.pmx"

float Specular_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular_I"; >;
float Specular1_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular1_I"; >;
float Specular2_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular2_I"; >;
float Specular3_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular3_I"; >;
float Specular4_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular4_I"; >;
float Specular5_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular5_I"; >;
float Specular6_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular6_I"; >;
float Specular7_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular7_I"; >;
float Specular8_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular8_I"; >;
float Specular9_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular9_I"; >;
float Specular10_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular10_I"; >;
float Specular11_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular11_I"; >;
float Specular12_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular12_I"; >;
float Specular13_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular13_I"; >;


float Brightness : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Brightness"; >;
float Direction : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Direction"; >;
////////////////////////////////////////////////////////////////////////////////////////////////

sampler DefSampler : register(s0);

struct BufferShadow_INPUT {
    float4 Pos      : POSITION; // Position
    float3 Normal   : NORMAL; // Normal
	float2 UV		: TEXCOORD0;
	float3 Eye		: TEXCOORD1;
};

struct BufferShadow_OUTPUT {
	float4 Pos 		: POSITION;
    float3 Normal   : NORMAL; // Normal
	float2 UV : TEXCOORD0;
	float3 Eye : TEXCOORD1;
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
	
	// World view projective transformation from camera perspective
	Out.Pos = mul( IN.Pos, WorldViewProjMatrix );
	
	// Relative to the camera position
	Out.Eye = CameraPosition - mul( IN.Pos, WorldMatrix );	
	
	return Out;
}
///////////////////////////////////////////////////////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////////////////////////////////////
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

    float4 Color		= float4(0,0,0,1);

	float3 Eye			= normalize(IN.Eye);

//////////////////////////////////////////////////
// Irradiance

	float3 EyeL = reflect(-Eye, Normal) * float3(1,1,-1);
	
	float4 Irradiance = texCUBElod(IrradianceSampler, float4(EyeL, 0)) + Brightness;
	float4 Irradiance1 = texCUBElod(IrradianceSampler1, float4( EyeL, 0)) + Brightness;
	float4 Irradiance2 = texCUBElod(IrradianceSampler2, float4( EyeL, 0)) + Brightness;
	float4 Irradiance3 = texCUBElod(IrradianceSampler3, float4( EyeL, 0)) + Brightness;
	float4 Irradiance4 = texCUBElod(IrradianceSampler4, float4( EyeL, 0)) + Brightness;
	float4 Irradiance5 = texCUBElod(IrradianceSampler5, float4( EyeL, 0)) + Brightness;
	float4 Irradiance6 = texCUBElod(IrradianceSampler6, float4( EyeL, 0)) + Brightness;
	float4 Irradiance7 = texCUBElod(IrradianceSampler7, float4( EyeL, 0)) + Brightness;
	float4 Irradiance8 = texCUBElod(IrradianceSampler8, float4( EyeL, 0)) + Brightness;
	float4 Irradiance9 = texCUBElod(IrradianceSampler9, float4( EyeL, 0)) + Brightness;
	float4 Irradiance10 = texCUBElod(IrradianceSampler10, float4( EyeL, 0)) + Brightness;
	float4 Irradiance11 = texCUBElod(IrradianceSampler11, float4( EyeL, 0)) + Brightness;
	float4 Irradiance12 = texCUBElod(IrradianceSampler12, float4( EyeL, 0)) + Brightness;
	float4 Irradiance13 = texCUBElod(IrradianceSampler13, float4( EyeL, 0)) + Brightness;

	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance.rgb, 1 + -Specular_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance1.rgb, 0 + Specular1_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance2.rgb, 0 + Specular2_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance3.rgb, 0 + Specular3_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance4.rgb, 0 + Specular4_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance5.rgb, 0 + Specular5_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance6.rgb, 0 + Specular6_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance7.rgb, 0 + Specular7_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance8.rgb, 0 + Specular8_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance9.rgb, 0 + Specular9_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance10.rgb, 0 + Specular10_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance11.rgb, 0 + Specular11_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance12.rgb, 0 + Specular12_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Irradiance13.rgb, 0 + Specular13_I);
	
	float4 TexColor		= tex2D( ObjTexSampler, IN.UV );
	
	DiffuseColor.a = clamp(DiffuseColor.a, 0.0f, 1.0f);
	Color.a *= TexColor.a;
	Color.a *= DiffuseColor.a;
	
	float3 noise = rand(IN.UV);
    if (Color.a < noise.r) discard;
	
	clip(Color.a < 0.5 ? -1:1);
	
//////////////////////////////////////////////////

        return Color;
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
