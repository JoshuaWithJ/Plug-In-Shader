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

//Specular
textureCUBE Specular  <
    string ResourceName = "Specular/Specular.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler = sampler_state {
    Texture = <Specular>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 1
textureCUBE Specular1  <
    string ResourceName = "Specular/Specular1.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler1 = sampler_state {
    Texture = <Specular1>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 2
textureCUBE Specular2  <
    string ResourceName = "Specular/Specular2.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler2 = sampler_state {
    Texture = <Specular2>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 3
textureCUBE Specular3  <
    string ResourceName = "Specular/Specular3.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler3 = sampler_state {
    Texture = <Specular3>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 4
textureCUBE Specular4  <
    string ResourceName = "Specular/Specular4.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler4 = sampler_state {
    Texture = <Specular4>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 5
textureCUBE Specular5  <
    string ResourceName = "Specular/Specular5.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler5 = sampler_state {
    Texture = <Specular5>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 6
textureCUBE Specular6  <
    string ResourceName = "Specular/Specular6.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler6 = sampler_state {
    Texture = <Specular6>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 7
textureCUBE Specular7  <
    string ResourceName = "Specular/Specular7.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler7 = sampler_state {
    Texture = <Specular7>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 8
textureCUBE Specular8  <
    string ResourceName = "Specular/Specular8.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler8 = sampler_state {
    Texture = <Specular8>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 9
textureCUBE Specular9  <
    string ResourceName = "Specular/Specular9.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler9 = sampler_state {
    Texture = <Specular9>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 10
textureCUBE Specular10  <
    string ResourceName = "Specular/Specular10.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler10 = sampler_state {
    Texture = <Specular10>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 11
textureCUBE Specular11  <
    string ResourceName = "Specular/Specular12.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler11 = sampler_state {
    Texture = <Specular11>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 12
textureCUBE Specular12  <
    string ResourceName = "Specular/Specular.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler12 = sampler_state {
    Texture = <Specular12>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 13
textureCUBE Specular13  <
    string ResourceName = "Specular/Specular13.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler13 = sampler_state {
    Texture = <Specular13>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//Specular 14
textureCUBE Specular14  <
    string ResourceName = "Specular/Specular14.dds";
    string Format = "A16B16G16R16F";>;
sampler SpecularSampler14 = sampler_state {
    Texture = <Specular14>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

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
float Specular14_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Specular14_I"; >;

float Brightness : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Brightness"; >;
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
// Specular

	float3x3 RotationTransform;

	float length1 = length(LightDirection.xyz * float3(1, -1, -1) + IBLR);
    if (length1 >= 0.000001f) {
        float3 cube_direction = (LightDirection.xyz * float3(1, -1, -1) + IBLR) * (1.0f / length1);

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
	
	float Eyerot_x = radians(22.5);
    float Eyerot_y = radians(-22.5);
    float Eyerot_z = radians(45);
	
	float3x3 EyeRotationX = {
	    {1,	0,	0},
	    {0, cos(Eyerot_x), sin(Eyerot_x)},
	    {0, -sin(Eyerot_x), cos(Eyerot_x)},
	};
	float3x3 EyeRotationY = {
	    {cos(Eyerot_y), 0, -sin(Eyerot_y)},
	    {0, 1, 0},
		{sin(Eyerot_y), 0,cos(Eyerot_y)},
	    };
	float3x3 EyeRotationZ = {
	    {cos(Eyerot_z), sin(Eyerot_z), 0},
	    {-sin(Eyerot_z), cos(Eyerot_z), 0},
	    {0, 0, 1},
	};
	float3x3 EyeRot = RotationTransform;
    EyeRot = mul( EyeRot, EyeRotationX );
    EyeRot = mul( EyeRot, EyeRotationY );
    EyeRot = mul( EyeRot, EyeRotationZ );
	float3 EyeL = mul(Eye, (float3x3)EyeRot);
	
	float4 Specular = texCUBElod(SpecularSampler, float4(EyeL, 0)) + Brightness;
	float4 Specular1 = texCUBElod(SpecularSampler1, float4( EyeL, 0)) + Brightness;
	float4 Specular2 = texCUBElod(SpecularSampler2, float4( EyeL, 0)) + Brightness;
	float4 Specular3 = texCUBElod(SpecularSampler3, float4( EyeL, 0)) + Brightness;
	float4 Specular4 = texCUBElod(SpecularSampler4, float4( EyeL, 0)) + Brightness;
	float4 Specular5 = texCUBElod(SpecularSampler5, float4( EyeL, 0)) + Brightness;
	float4 Specular6 = texCUBElod(SpecularSampler6, float4( EyeL, 0)) + Brightness;
	float4 Specular7 = texCUBElod(SpecularSampler7, float4( EyeL, 0)) + Brightness;
	float4 Specular8 = texCUBElod(SpecularSampler8, float4( EyeL, 0)) + Brightness;
	float4 Specular9 = texCUBElod(SpecularSampler9, float4( EyeL, 0)) + Brightness;
	float4 Specular10 = texCUBElod(SpecularSampler10, float4( EyeL, 0)) + Brightness;
	float4 Specular11 = texCUBElod(SpecularSampler11, float4( EyeL, 0)) + Brightness;
	float4 Specular12 = texCUBElod(SpecularSampler12, float4( EyeL, 0)) + Brightness;
	float4 Specular13 = texCUBElod(SpecularSampler13, float4( EyeL, 0)) + Brightness;
	float4 Specular14 = texCUBElod(SpecularSampler14, float4( EyeL, 0)) + Brightness;

	Color.rgb = lerp(Color.rgb, Color.rgb + Specular.rgb, 1 + -Specular_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular1.rgb, 0 + Specular1_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular2.rgb, 0 + Specular2_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular3.rgb, 0 + Specular3_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular4.rgb, 0 + Specular4_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular5.rgb, 0 + Specular5_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular6.rgb, 0 + Specular6_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular7.rgb, 0 + Specular7_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular8.rgb, 0 + Specular8_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular9.rgb, 0 + Specular9_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular10.rgb, 0 + Specular10_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular11.rgb, 0 + Specular11_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular12.rgb, 0 + Specular12_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular13.rgb, 0 + Specular13_I);
	Color.rgb = lerp(Color.rgb, Color.rgb + Specular14.rgb, 0 + Specular14_I);
	
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
