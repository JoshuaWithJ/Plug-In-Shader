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

//IBL
textureCUBE IBLMap  <
    string ResourceName = "IBL/IBL.dds";
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

//IBL 1
textureCUBE IBLMap1  <
    string ResourceName = "IBL/IBL1.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler1 = sampler_state {
    Texture = <IBLMap1>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 2
textureCUBE IBLMap2  <
    string ResourceName = "IBL/IBL2.dds";
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
    string ResourceName = "IBL/IBL3.dds";
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

//IBL 4
textureCUBE IBLMap4  <
    string ResourceName = "IBL/IBL4.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler4 = sampler_state {
    Texture = <IBLMap4>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 5
textureCUBE IBLMap5  <
    string ResourceName = "IBL/IBL5.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler5 = sampler_state {
    Texture = <IBLMap5>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 6
textureCUBE IBLMap6  <
    string ResourceName = "IBL/IBL6.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler6 = sampler_state {
    Texture = <IBLMap6>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 7
textureCUBE IBLMap7  <
    string ResourceName = "IBL/IBL7.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler7 = sampler_state {
    Texture = <IBLMap7>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 8
textureCUBE IBLMap8  <
    string ResourceName = "IBL/IBL8.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler8 = sampler_state {
    Texture = <IBLMap8>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 9
textureCUBE IBLMap9  <
    string ResourceName = "IBL/IBL9.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler9 = sampler_state {
    Texture = <IBLMap9>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 10
textureCUBE IBLMAP10  <
    string ResourceName = "IBL/IBL10.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler10 = sampler_state {
    Texture = <IBLMAP10>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 11
textureCUBE IBLMAP11  <
    string ResourceName = "IBL/IBL12.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler11 = sampler_state {
    Texture = <IBLMAP11>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 12
textureCUBE IBLMAP12  <
    string ResourceName = "IBL/IBL.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler12 = sampler_state {
    Texture = <IBLMAP12>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 15
textureCUBE IBLMAP13  <
    string ResourceName = "IBL/IBL13.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler13 = sampler_state {
    Texture = <IBLMAP13>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = POINT;
    ADDRESSU  = CLAMP;
    ADDRESSV  = CLAMP;
    ADDRESSW  = CLAMP;
};

//IBL 14
textureCUBE IBLMAP14  <
    string ResourceName = "IBL/IBL14.dds";
    string Format = "A16B16G16R16F";>;
sampler IBLSampler14 = sampler_state {
    Texture = <IBLMAP14>;
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

float IBL_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL_I"; >;
float IBL1_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL1_I"; >;
float IBL2_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL2_I"; >;
float IBL3_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL3_I"; >;
float IBL4_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL4_I"; >;
float IBL5_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL5_I"; >;
float IBL6_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL6_I"; >;
float IBL7_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL7_I"; >;
float IBL8_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL8_I"; >;
float IBL9_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL9_I"; >;
float IBL10_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL10_I"; >;
float IBL11_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL11_I"; >;
float IBL12_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL12_I"; >;
float IBL13_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL13_I"; >;
float IBL14_I : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "IBL14_I"; >;

float Brightness : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Brightness"; >;
float Direction : CONTROLOBJECT < string name = "IBL RT - Controller.pmx"; string item = "Direction"; >;
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
	
//////////////////////////////////////////////////
	float3 Normal		= normalize(IN.Normal);
//////////////////////////////////////////////////

    float4 Color		= float4(1,1,1,1);
	
//////////////////////////////////////////////////
// IBL
	//Rotation
	
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
	float3 IBLPosOnn = mul(Normal* float3(1,1,-1), (float3x3)IBLRot);
	float3 IBLPosOff = Normal * float3(1,1,-1);
	float3 IBLPos = 1;
	IBLPos *= IBLPosOnn;
	IBLPos = lerp(IBLPos, IBLPosOff, step(1.0 / 2.0, Direction));
	
	float4 IBL = texCUBElod(IBLSampler, float4( IBLPos, 0)) + Brightness;
	float4 IBL1 = texCUBElod(IBLSampler1, float4( IBLPos, 0)) + Brightness;
	float4 IBL2 = texCUBElod(IBLSampler2, float4( IBLPos, 0)) + Brightness;
	float4 IBL3 = texCUBElod(IBLSampler3, float4( IBLPos, 0)) + Brightness;
	float4 IBL4 = texCUBElod(IBLSampler4, float4( IBLPos, 0)) + Brightness;
	float4 IBL5 = texCUBElod(IBLSampler5, float4( IBLPos, 0)) + Brightness;
	float4 IBL6 = texCUBElod(IBLSampler6, float4( IBLPos, 0)) + Brightness;
	float4 IBL7 = texCUBElod(IBLSampler7, float4( IBLPos, 0)) + Brightness;
	float4 IBL8 = texCUBElod(IBLSampler8, float4( IBLPos, 0)) + Brightness;
	float4 IBL9 = texCUBElod(IBLSampler9, float4( IBLPos, 0)) + Brightness;
	float4 IBL10 = texCUBElod(IBLSampler10, float4( IBLPos, 0)) + Brightness;
	float4 IBL11 = texCUBElod(IBLSampler11, float4( IBLPos, 0)) + Brightness;
	float4 IBL12 = texCUBElod(IBLSampler12, float4( IBLPos, 0)) + Brightness;
	float4 IBL13 = texCUBElod(IBLSampler13, float4( IBLPos, 0)) + Brightness;
	float4 IBL14 = texCUBElod(IBLSampler14, float4( IBLPos, 0)) + Brightness;
	
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL.rgb, 1 - IBL_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL1.rgb, 0 + IBL1_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL2.rgb, 0 + IBL2_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL3.rgb, 0 + IBL3_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL4.rgb, 0 + IBL4_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL5.rgb, 0 + IBL5_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL6.rgb, 0 + IBL6_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL7.rgb, 0 + IBL7_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL8.rgb, 0 + IBL8_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL9.rgb, 0 + IBL9_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL10.rgb, 0 + IBL10_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL11.rgb, 0 + IBL11_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL12.rgb, 0 + IBL12_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL13.rgb, 0 + IBL13_I);
	Color.rgb = lerp(Color.rgb, Color.rgb * IBL14.rgb, 0 + IBL14_I);
	
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
