//////////////////////////////////////////////////////////////////////////////////////
//
// - Plug-In Shader - by Joshua: Point Light Sampler
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

#define ALPHA_BLEND_APPLY	1
#define ALPHA_TEST_APPLY	0

#define ALPHA_BLEND_TYPE	1
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

#define Point_Control  "RT Base.x"
bool POINTRT_Valid  : CONTROLOBJECT < string name = Point_Control; >;

//Point Screen RT
shared texture2D SCREEN_RT : RENDERCOLORTARGET;
sampler2D ScreenRT_Samp = sampler_state {
	texture = <SCREEN_RT>;
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
float4x4 WorldMatrix				: WORLD;

// Light Color
float3   CameraPosition	: POSITION  < string Object = "Camera"; >;

float time : TIME;

// Material color
float4	MaterialDiffuse		: DIFFUSE
<
string Object = "Geometry";
   string UIWidget = "Numeric";
   bool UIVisible =  true;
   int UIMin = 0;
   int UIMax = 1;
>;
////////////////////////////////////////////////////////////////////////////////////////////////

#define PS0_C  "PointLight0.pmx"
bool PS0_Valid  : CONTROLOBJECT < string name = PS0_C; >;

#define PS1_C  "PointLight1.pmx"
bool PS1_Valid  : CONTROLOBJECT < string name = PS1_C; >;

#define PS2_C  "PointLight2.pmx"
bool PS2_Valid  : CONTROLOBJECT < string name = PS2_C; >;

#define PS3_C  "PointLight3.pmx"
bool PS3_Valid  : CONTROLOBJECT < string name = PS3_C; >;

#define PS4_C  "PointLight4.pmx"
bool PS4_Valid  : CONTROLOBJECT < string name = PS4_C; >;

#define PS5_C  "PointLight5.pmx"
bool PS5_Valid  : CONTROLOBJECT < string name = PS5_C; >;

#define PS6_C  "PointLight6.pmx"
bool PS6_Valid  : CONTROLOBJECT < string name = PS6_C; >;

#define PS7_C  "PointLight7.pmx"
bool PS7_Valid  : CONTROLOBJECT < string name = PS7_C; >;

#define PS8_C  "PointLight8.pmx"
bool PS8_Valid  : CONTROLOBJECT < string name = PS8_C; >;

#define PS9_C  "PointLight9.pmx"
bool PS9_Valid  : CONTROLOBJECT < string name = PS9_C; >;

#define PS10_C  "PointLight10.pmx"
bool PS10_Valid  : CONTROLOBJECT < string name = PS10_C; >;

#define PS11_C  "PointLight1.pmx"
bool PS11_Valid  : CONTROLOBJECT < string name = PS11_C; >;

#define PS12_C  "PointLight12.pmx"
bool PS12_Valid  : CONTROLOBJECT < string name = PS12_C; >;

#define PS13_C  "PointLight13.pmx"
bool PS13_Valid  : CONTROLOBJECT < string name = PS13_C; >;

#define PS14_C  "PointLight14.pmx"
bool PS14_Valid  : CONTROLOBJECT < string name = PS14_C; >;

////////////////////////////////////////////////////////////////////////////////////////////////

float3 PL_POS0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "PL_POS"; >;

float SizeP0   : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Size+"; >;
float SizeL0   : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Size-"; >;
float SpreadP0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Spread+"; >;
float SpreadL0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Spread-"; >;


float R0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "C_R"; >;
float G0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "C_G"; >;
float B0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "C_B"; >;

float Intensity0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Intensity"; >;

float NormalsP0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Normals+"; >;
float NormalsL0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Normals-"; >;

float Flickering0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "Flickering"; >;

float4x4 PLRB0 : CONTROLOBJECT < string name = "PointLight0.pmx"; string item = "PL_POS"; >;
static float3 PLR0 = -PLRB0._31_32_33;
//////////////////////////////////////////////////

float3 PL_POS1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "PL_POS"; >;

float SizeP1   : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Size+"; >;
float SizeL1   : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Size-"; >;
float SpreadP1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Spread+"; >;
float SpreadL1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Spread-"; >;

float R1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "C_R"; >;
float G1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "C_G"; >;
float B1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "C_B"; >;

float Intensity1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Intensity"; >;

float NormalsP1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Normals+"; >;
float NormalsL1: CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Normals-"; >;

float Flickering1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "Flickering"; >;

float4x4 PLRB1 : CONTROLOBJECT < string name = "PointLight1.pmx"; string item = "PL_POS"; >;
static float3 PLR1 = -PLRB1._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "PL_POS"; >;

float SizeP2   : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Size+"; >;
float SizeL2   : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Size-"; >;
float SpreadP2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Spread+"; >;
float SpreadL2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Spread-"; >;

float R2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "C_R"; >;
float G2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "C_G"; >;
float B2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "C_B"; >;

float Intensity2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Intensity"; >;

float NormalsP2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Normals+"; >;
float NormalsL2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Normals-"; >;

float Flickering2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "Flickering"; >;

float4x4 PLRB2 : CONTROLOBJECT < string name = "PointLight2.pmx"; string item = "PL_POS"; >;
static float3 PLR2 = -PLRB2._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "PL_POS"; >;

float SizeP3   : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Size+"; >;
float SizeL3   : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Size-"; >;
float SpreadP3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Spread+"; >;
float SpreadL3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Spread-"; >;

float R3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "C_R"; >;
float G3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "C_G"; >;
float B3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "C_B"; >;

float Intensity3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Intensity"; >;

float NormalsP3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Normals+"; >;
float NormalsL3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Normals-"; >;

float Flickering3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "Flickering"; >;

float4x4 PLRB3 : CONTROLOBJECT < string name = "PointLight3.pmx"; string item = "PL_POS"; >;
static float3 PLR3 = -PLRB3._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "PL_POS"; >;

float SizeP4   : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Size+"; >;
float SizeL4   : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Size-"; >;
float SpreadP4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Spread+"; >;
float SpreadL4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Spread-"; >;

float R4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "C_R"; >;
float G4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "C_G"; >;
float B4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "C_B"; >;

float Intensity4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Intensity"; >;

float NormalsP4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Normals+"; >;
float NormalsL4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Normals-"; >;

float Flickering4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "Flickering"; >;

float4x4 PLRB4 : CONTROLOBJECT < string name = "PointLight4.pmx"; string item = "PL_POS"; >;
static float3 PLR4 = -PLRB4._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "PL_POS"; >;

float SizeP5   : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Size+"; >;
float SizeL5   : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Size-"; >;
float SpreadP5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Spread+"; >;
float SpreadL5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Spread-"; >;

float R5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "C_R"; >;
float G5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "C_G"; >;
float B5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "C_B"; >;

float Intensity5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Intensity"; >;

float NormalsP5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Normals+"; >;
float NormalsL5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Normals-"; >;

float Flickering5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "Flickering"; >;

float4x4 PLRB5 : CONTROLOBJECT < string name = "PointLight5.pmx"; string item = "PL_POS"; >;
static float3 PLR5 = -PLRB5._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "PL_POS"; >;

float SizeP6   : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Size+"; >;
float SizeL6   : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Size-"; >;
float SpreadP6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Spread+"; >;
float SpreadL6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Spread-"; >;

float R6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "C_R"; >;
float G6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "C_G"; >;
float B6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "C_B"; >;

float Intensity6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Intensity"; >;

float NormalsP6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Normals+"; >;
float NormalsL6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Normals-"; >;

float Flickering6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "Flickering"; >;

float4x4 PLRB6 : CONTROLOBJECT < string name = "PointLight6.pmx"; string item = "PL_POS"; >;
static float3 PLR6 = -PLRB6._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "PL_POS"; >;

float SizeP7   : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Size+"; >;
float SizeL7   : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Size-"; >;
float SpreadP7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Spread+"; >;
float SpreadL7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Spread-"; >;

float R7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "C_R"; >;
float G7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "C_G"; >;
float B7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "C_B"; >;

float Intensity7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Intensity"; >;

float NormalsP7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Normals+"; >;
float NormalsL7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Normals-"; >;

float Flickering7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "Flickering"; >;

float4x4 PLRB7 : CONTROLOBJECT < string name = "PointLight7.pmx"; string item = "PL_POS"; >;
static float3 PLR7 = -PLRB7._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "PL_POS"; >;

float SizeP8   : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Size+"; >;
float SizeL8   : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Size-"; >;
float SpreadP8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Spread+"; >;
float SpreadL8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Spread-"; >;

float R8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "C_R"; >;
float G8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "C_G"; >;
float B8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "C_B"; >;

float Intensity8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Intensity"; >;

float NormalsP8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Normals+"; >;
float NormalsL8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Normals-"; >;

float Flickering8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "Flickering"; >;

float4x4 PLRB8 : CONTROLOBJECT < string name = "PointLight8.pmx"; string item = "PL_POS"; >;
static float3 PLR8 = -PLRB8._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "PL_POS"; >;

float SizeP9   : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Size+"; >;
float SizeL9   : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Size-"; >;
float SpreadP9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Spread+"; >;
float SpreadL9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Spread-"; >;

float R9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "C_R"; >;
float G9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "C_G"; >;
float B9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "C_B"; >;

float Intensity9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Intensity"; >;

float NormalsP9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Normals+"; >;
float NormalsL9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Normals-"; >;

float Flickering9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "Flickering"; >;

float4x4 PLRB9 : CONTROLOBJECT < string name = "PointLight9.pmx"; string item = "PL_POS"; >;
static float3 PLR9 = -PLRB9._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "PL_POS"; >;

float SizeP10   : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Size+"; >;
float SizeL10   : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Size-"; >;
float SpreadP10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Spread+"; >;
float SpreadL10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Spread-"; >;


float R10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "C_R"; >;
float G10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "C_G"; >;
float B10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "C_B"; >;

float Intensity10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Intensity"; >;

float NormalsP10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Normals+"; >;
float NormalsL10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Normals-"; >;

float Flickering10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "Flickering"; >;

float4x4 PLRB10 : CONTROLOBJECT < string name = "PointLight10.pmx"; string item = "PL_POS"; >;
static float3 PLR10 = -PLRB10._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "PL_POS"; >;

float SizeP11   : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Size+"; >;
float SizeL11   : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Size-"; >;
float SpreadP11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Spread+"; >;
float SpreadL11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Spread-"; >;

float R11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "C_R"; >;
float G11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "C_G"; >;
float B11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "C_B"; >;

float Intensity11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Intensity"; >;

float NormalsP11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Normals+"; >;
float NormalsL11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Normals-"; >;

float Flickering11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "Flickering"; >;

float4x4 PLRB11 : CONTROLOBJECT < string name = "PointLight11.pmx"; string item = "PL_POS"; >;
static float3 PLR11 = -PLRB11._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "PL_POS"; >;

float SizeP12   : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Size+"; >;
float SizeL12   : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Size-"; >;
float SpreadP12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Spread+"; >;
float SpreadL12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Spread-"; >;

float R12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "C_R"; >;
float G12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "C_G"; >;
float B12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "C_B"; >;

float Intensity12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Intensity"; >;

float NormalsP12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Normals+"; >;
float NormalsL12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Normals-"; >;

float Flickering12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "Flickering"; >;

float4x4 PLRB12 : CONTROLOBJECT < string name = "PointLight12.pmx"; string item = "PL_POS"; >;
static float3 PLR12 = -PLRB12._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "PL_POS"; >;

float SizeP13   : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Size+"; >;
float SizeL13   : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Size-"; >;
float SpreadP13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Spread+"; >;
float SpreadL13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Spread-"; >;

float R13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "C_R"; >;
float G13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "C_G"; >;
float B13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "C_B"; >;

float Intensity13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Intensity"; >;

float NormalsP13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Normals+"; >;
float NormalsL13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Normals-"; >;

float Flickering13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "Flickering"; >;

float4x4 PLRB13 : CONTROLOBJECT < string name = "PointLight13.pmx"; string item = "PL_POS"; >;
static float3 PLR13 = -PLRB13._31_32_33;

//////////////////////////////////////////////////

float3 PL_POS14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "PL_POS"; >;

float SizeP14   : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Size+"; >;
float SizeL14   : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Size-"; >;
float SpreadP14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Spread+"; >;
float SpreadL14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Spread-"; >;

float R14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "C_R"; >;
float G14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "C_G"; >;
float B14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "C_B"; >;

float Intensity14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Intensity"; >;

float NormalsP14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Normals+"; >;
float NormalsL14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Normals-"; >;

float Flickering14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "Flickering"; >;

float4x4 PLRB14 : CONTROLOBJECT < string name = "PointLight14.pmx"; string item = "PL_POS"; >;
static float3 PLR14 = -PLRB14._31_32_33;

//////////////////////////////////////////////////

sampler DefSampler : register(s0);

struct BufferShadow_INPUT {
	float4 Pos	  : POSITION; // Position
	float3 Normal   : NORMAL; // Normal
	float2 UV : TEXCOORD0;
};

struct BufferShadow_OUTPUT {
	float4 Pos 		: POSITION;
	float3 Normal   : NORMAL; // Normal
	float2 UV		: TEXCOORD0;
	float3 WorldPos	: TEXCOORD7; // Positon for HgShadow
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
	
	// World view projective transformation from camera perspective
	Out.Pos = mul( IN.Pos, WorldViewProjMatrix );
	
	// HgShadow
	Out.PPos = Out.Pos;
	
	//PL
	Out.WorldPos = mul( IN.Pos, WorldMatrix );
	
	return Out;
}
////////////////////////////////////////////////////////////////////////////////////////////////
// Vertex Shader 2
BufferShadow_OUTPUT BufferShadow_VSD(BufferShadow_INPUT IN)
{
	BufferShadow_OUTPUT Out = (BufferShadow_OUTPUT)0;
	
	IN.Pos.xyz -=(normalize(IN.Normal) * 0.0);
	// UV
	Out.UV = IN.UV;
	
	// Vertex Normal
	Out.Normal = normalize( mul( IN.Normal, (float3x3)WorldMatrix ) );
	
	// World view projective transformation from camera perspective
	Out.Pos = mul( IN.Pos, WorldViewProjMatrix );
	
	// HgShadow
	Out.PPos = Out.Pos;
	
	//PL
	Out.WorldPos = mul( IN.Pos, WorldMatrix );
	
	return Out;
}
////////////////////////////////////////////////////////////////////////////////////////////////

float LightSize = 1.0;

// Circular Light Influence Function
float circularAtten(float dist, float SizeP1_, float SizeL_) {
	return saturate(1.0 - dist / (SizeP1_ * 100 * (1 - SizeL_) ) );
}


float normalInfluence(float3 worldPos, float3 lightDir, float3 normal) {
	return max(dot(normal, lightDir), 0.0);
}


static float3 PointLights[] = {
	PL_POS0,
	PL_POS1,
	PL_POS2,
	PL_POS3,
	PL_POS4,
	PL_POS5,
	PL_POS6,
	PL_POS7,
	PL_POS8,
	PL_POS9,
	PL_POS10,
	PL_POS11,
	PL_POS12,
	PL_POS13,
	PL_POS14,
};

static float3 PLR[] = {
	PLR0,
	PLR1,
	PLR2,
	PLR3,
	PLR4,
	PLR5,
	PLR6,
	PLR7,
	PLR8,
	PLR9,
	PLR10,
	PLR11,
	PLR12,
	PLR13,
	PLR14,

};

static float SizeP[] = {
	SizeP0,
	SizeP1,
	SizeP2,
	SizeP3,
	SizeP4,
	SizeP5,
	SizeP6,
	SizeP7,
	SizeP8,
	SizeP9,
	SizeP10,
	SizeP11,
	SizeP12,
	SizeP13,
	SizeP14,
};

static float SizeL[] = {
	SizeL0,
	SizeL1,
	SizeL2,
	SizeL3,
	SizeL4,
	SizeL5,
	SizeL6,
	SizeL7,
	SizeL8,
	SizeL9,
	SizeL10,
	SizeL11,
	SizeL12,
	SizeL13,
	SizeL14,
};

static float SpreadP[] = {
	SpreadP0,
	SpreadP1,
	SpreadP2,
	SpreadP3,
	SpreadP4,
	SpreadP5,
	SpreadP6,
	SpreadP7,
	SpreadP8,
	SpreadP9,
	SpreadP10,
	SpreadP11,
	SpreadP12,
	SpreadP13,
	SpreadP14,
};

static float SpreadL[] = {
	SpreadL0,
	SpreadL1,
	SpreadL2,
	SpreadL3,
	SpreadL4,
	SpreadL5,
	SpreadL6,
	SpreadL7,
	SpreadL8,
	SpreadL9,
	SpreadL10,
	SpreadL11,
	SpreadL12,
	SpreadL13,
	SpreadL14,
};

static float Intensity[] = {
	Intensity0,
	Intensity1,
	Intensity2,
	Intensity3,
	Intensity4,
	Intensity5,
	Intensity6,
	Intensity7,
	Intensity8,
	Intensity9,
	Intensity10,
	Intensity11,
	Intensity12,
	Intensity13,
	Intensity14,
};

static float Flickering[] = {
	Flickering0,
	Flickering1,
	Flickering2,
	Flickering3,
	Flickering4,
	Flickering5,
	Flickering6,
	Flickering7,
	Flickering8,
	Flickering9,
	Flickering10,
	Flickering11,
	Flickering12,
	Flickering13,
	Flickering14,
};

static float NormalsP[] = {
	NormalsP0,
	NormalsP1,
	NormalsP2,
	NormalsP3,
	NormalsP4,
	NormalsP5,
	NormalsP6,
	NormalsP7,
	NormalsP8,
	NormalsP9,
	NormalsP10,
	NormalsP11,
	NormalsP12,
	NormalsP13,
	NormalsP14,
};

static float NormalsL[] = {
	NormalsL0,
	NormalsL1,
	NormalsL2,
	NormalsL3,
	NormalsL4,
	NormalsL5,
	NormalsL6,
	NormalsL7,
	NormalsL8,
	NormalsL9,
	NormalsL10,
	NormalsL11,
	NormalsL12,
	NormalsL13,
	NormalsL14,
};

static float3 lightColors[] = {
	float3(R0,G0,B0),
	float3(R1,G1,B1),
	float3(R2,G2,B2),
	float3(R3,G3,B3),
	float3(R4,G4,B4),
	float3(R5,G5,B5),
	float3(R6,G6,B6),
	float3(R7,G7,B7),
	float3(R8,G8,B8),
	float3(R9,G9,B9),
	float3(R10,G10,B10),
	float3(R11,G11,B11),
	float3(R12,G12,B12),
	float3(R13,G13,B13),
	float3(R14,G14,B14),
};

////////////////////////////////////////////////////////////////////////////////////////////////
// Pixel Shader
float4 BufferShadow_PS(BufferShadow_OUTPUT IN) : COLOR
{
//////////////////////////////////////////////////
// Inputs
//////////////////////////////////////////////////
	float3 Normal		= normalize(IN.Normal);
	float4 Color		= 1;
	float4 ColorTex		=  tex2D(ObjTexSampler, IN.UV);
	
	Color.rgb = float3(0,0,0);
	
//////////////////////////////////////////////////
// P Light 1


	int lightCount = 15;
	
	for (int i = 0; i < lightCount; i++) {
	
		float3 LightColor_1 = lightColors[i];
		
		float3 Light_Pos = PointLights[i];

		float dist_1 = length(Light_Pos -IN.WorldPos);

		float3 lightDir_1 = normalize(Light_Pos - IN.WorldPos);

		float atten_1 = circularAtten(dist_1, SizeP[i], SizeL[i]);

		float normalFactor_1 = normalInfluence(IN.WorldPos + (SizeP[i]) , lightDir_1, IN.Normal * 100 * (1 - SizeL[i]));

		float NormalsLF = NormalsL[i];
		float NormalsPF = NormalsP[i];
		
		NormalsLF = clamp(NormalsLF, 0, 0.5);
		NormalsPF = clamp(NormalsPF, 0, 0.5);
	
		float PLMATH = (atten_1 * 0.5 + ( NormalsPF * 10) ) * (normalFactor_1 * 0.5 + ( NormalsLF * 10 ) );
		
		float LightSpread_1 = -dist_1 * 1 * (SpreadL[i] * 10) + (SpreadP[i] * 10);
		
		float scatter_1 = exp(LightSpread_1) * PLMATH ;

		float3 lightEffect_1 = LightColor_1 * atten_1 * scatter_1;

		float LightBounceSpeed_1 = 0 + Flickering[i] * 100;
		float LightBounce_1 = (sin(time * LightBounceSpeed_1) + 1) * 0.5;
		
		lightEffect_1 *= LightBounce_1;
		
		lightEffect_1 = clamp(lightEffect_1,0,5);
		
		lightEffect_1 *= (1 - Intensity[i]);
		
		Color += float4(lightEffect_1, atten_1 * scatter_1);
	}
	
//////////////////////////////////////////////////

	Color.a		*= ColorTex.a;
	clip(Color.a < 0.5 ? -1:1);
	Color.a		*= MaterialDiffuse.a;


//////////////////////////////////////////////////


		return Color;
}

///////////////////////////////////////////////////////////////////////////////////////////////
// Techniques
technique PGTech  < string MMDPass = "object_ss";
	string Script =
	
	"Pass=DrawObject;"
	"Pass=DrawObjectD;"
	;
	> {
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
	pass DrawObjectD {
		CULLMODE = CW;
		ZWRITEENABLE = FALSE;
	
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
        VertexShader = compile vs_3_0 BufferShadow_VSD();
        PixelShader  = compile ps_3_0 BufferShadow_PS();
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////
