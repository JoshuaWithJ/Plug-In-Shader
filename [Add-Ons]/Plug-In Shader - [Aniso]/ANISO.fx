//==============================//
//
// - Plug-In Shader Aniso Filter - By Infu_D
//
//==============================//
// Control

float BlurC : CONTROLOBJECT < string name = "(self)"; >;

//==============================//

  // Aniso:
  static float2 Intervals = float2(8.0 * (BlurC/10), 0.0); // Blur Size (Radius)
  static float Intensity = 1.2;  // Aniso Intensity
  //  More settings in "ps_aniso".
	
  // LUT:
  float Lut_Intensity = 1;
  #define TONE_MAP_SAT_GAMMA_SAMPLES 32
	
//==============================//
float Script : STANDARDSGLOBAL <
	string ScriptOutput = "color";
	string ScriptClass  = "scene";
	string ScriptOrder  = "postprocess";
> = 0.8;
//==============================//

//  Textures / Samplers  :
texture2D ScnMap : RENDERCOLORTARGET <
	float2 ViewportRatio ={0.25f, 0.25f};
	bool AntiAlias = true;
	int MipLevels = 1;
	string Format = "A16B16G16R16F";
>;
sampler2D ScnSamp = sampler_state {
	texture = <ScnMap>;
    FILTER = ANISOTROPIC;
    ADDRESSU = CLAMP;
    ADDRESSV = CLAMP;
};

//=== ANISO ===//
texture2D ANISO_SF : OFFSCREENRENDERTARGET
<
    string Description = "(ANISO) U/V/Radial Array";
	float2 ViewportRatio = {1.0f, 1.0f};
    float4 ClearColor = {1.0f, 1.0f, 1.0f, 0.0f};
    float ClearDepth = 1.0f;
	bool AntiAlias = true;
	int Miplevels = 0;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	    //"self=hide;"
	    "*=ANISO/V.fx;";
>;
sampler2D Expand_S = sampler_state {
    texture = <ANISO_SF>;
    FILTER = ANISOTROPIC;
    ADDRESSU = CLAMP;
    ADDRESSV = CLAMP;
};

texture2D g_expand : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;
sampler2D Aniso = sampler_state {
    texture = <g_expand>;
    FILTER = ANISOTROPIC;
    ADDRESSU = CLAMP;
    ADDRESSV = CLAMP;
};

//=== DEPTH ===//
texture DEPTH_SF : OFFSCREENRENDERTARGET
<   string Description = "ShaderFarc Depth";
    float2 ViewportRatio = {0.25f, 0.25f};
    float4 ClearColor = {0.0f, 0.0f, 0.0f, 0.0f};
    float ClearDepth = 1.0f;
	bool AntiAlias = true;
	int Miplevels = 1;
	string Format = "D3DFMT_R32F";
	string DefaultEffect = 
        "self = hide;"
        "*=ANISO/+/Depth.fx;";
>;
sampler2D DS = sampler_state {
	texture = <DEPTH_SF>;
    FILTER = ANISOTROPIC;
    ADDRESSU = CLAMP;
    ADDRESSV = CLAMP;
};

shared texture2D AnisoTex : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;

shared texture2D g_tonemap : RENDERCOLORTARGET <
	bool AntiAlias = true;
	int Width  = 256;
    int Height = 1;
	string Format = "A16B16G16R16F";
>;

texture2D DepthBuffer : RENDERDEPTHSTENCILTARGET <
	string Format = "D24S8";
>;

float Saturat_Pow : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Saturation_Pow";>;
float SaturationA : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Saturation +";>;
float SaturationB : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Saturation -";>;
float ExposureA   : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Exposure +";>;
float ExposureB   : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Exposure -";>;
float GammaA      : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Gamma +";>;
float GammaB      : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Gamma -";>;
float Override    : CONTROLOBJECT <string name="#ToneMap_Controller.pmx"; string item="Override";>;
	
float2 ViewportSize : VIEWPORTPIXELSIZE;
static const float2 ViewportOffset = float2(0.5,0.5)/ViewportSize;

float set(float A, float B) {
	return lerp(Lut_Intensity + (A * 2.5) * 1 - B, A, (int)Override); }
//============================================================================//
//  Base Structure  :
struct vs_in
{
  float4 v0 : POSITION0;
  float4 v1 : TEXCOORD0;
  float4 v2 : TEXCOORD1;
  float4 v3 : TEXCOORD2;
  float4 v4 : TEXCOORD3;
};
struct vs_out
{
  float4 o0 : SV_POSITION0;
  float4 o1 : TEXCOORD0;
  float4 o2 : TEXCOORD1;
  float4 o3 : TEXCOORD2;
  float4 o4 : TEXCOORD3;
};
//============================================================================//
//  Vertex Shader(s)  :
vs_out vs_model (vs_in i)
{
    vs_out o = (vs_out)0;
		
  o.o0 = i.v0;
  o.o1 = i.v1 + ViewportOffset.xyxy;
  
  float4 g_texcoord_modifier = float4(1, 1, 0, 0);
	float4 g_texel_size = float4(ViewportSize.xy*0.5*0.5* 0.00001, 320.00*2, 180.00*2);
	float2 r0 = i.v1;
  r0.xy = r0.xy * g_texcoord_modifier.xy + g_texcoord_modifier.zw;
  
  o.o2.xy = r0.xy;
  o.o3.xyzw = g_texel_size.xyxy * float4(-2,0,2,0) + r0.xyxy;
  o.o4.xyzw = g_texel_size.xyxy * float4(0,8,0,-8) + r0.xyxy;
  
    return o;
}
//============================================================================//
// Fragment Shader(s) :
float4 ps_expand(vs_out i) : COLOR0
{	
	float4 r0 = 1;
	float4 r1 = 1;
	float4 r2 = 1;
	
	float2 v1 = i.o1;
	float4 v2 = i.o3;
	float4 v3 = i.o4;
	float4 o0 = 0;
	
	r0.xyzw = tex2D(Expand_S, v1.xy).xyzw;
	return r0;
}

float4 ps_aniso(vs_out i) : COLOR0
{	
	float2 v1 = i.o1;
	float4 o0 = 0;
  
	float Pi = 6.28318530718; // Pi*2
  
	float Quality = 4.0f; // Blur Quality (Default 4.0)
    float Directions = 16.0f; // Blur Directions (Default 16.0)   
    float2 Radius = (lerp(Intervals.x, Intervals.y, saturate(tex2D(DS, v1).x)))/ViewportSize.xy;
    
    // Normalized pixel coordinates (from 0 to 1)
    float2 uv = v1.xy;
    // Pixel colour
    float4 Color = tex2D(Aniso, uv);
    
    // Blur calculations
    for( float d=0.0; d<Pi; d+=Pi/Directions)
    {
		for(float i=1.0/Quality; i<=1.0; i+=1.0/Quality)
        {
			Color += pow(tex2D( Aniso, uv+float2(cos(d),sin(d))*Radius*i), 2.2);		
        }
    }
    
    // Output to screen
    Color /= Quality * Directions;
	  return pow(0.3, saturate(1 - Color)) * Intensity;
}

float4 ps_tonemap(vs_out i, float2 UV : TEXCOORD0) : COLOR0
{	
	UV = UV/1.2;
	
	static float gamma_rate = set(GammaA, GammaB);
    static float saturate_coeff = set(SaturationA, SaturationB);
	
	const float tone_map_scale = (float)(UV.x / (double)TONE_MAP_SAT_GAMMA_SAMPLES);
    const int tone_map_size = 16 * TONE_MAP_SAT_GAMMA_SAMPLES;
	
	float2 tex_data[16 * TONE_MAP_SAT_GAMMA_SAMPLES];
    float gamma_power = 0.8333 * gamma_rate * 1.5f;
    
    tex_data[0].x = 0.0f;
    tex_data[0].y = 0.0f;
	for (int i = 1; i < tone_map_size; i++) {
		float gamma = pow(1.0f - exp((float)-i * tone_map_scale), gamma_power);
		tex_data[0].x = gamma;
	}
	
	int saturate_power = (int)(Saturat_Pow * 7);
	saturate_power = Saturat_Pow == 0 ? 1 : saturate_power;
	float saturation = tex_data[0].x * 2.0f - 1.0f;
	for (int j = 0; j < saturate_power; j++) {
		saturation *= saturation;
		saturation *= saturation;
		saturation *= saturation;
		saturation *= saturation;
    }
	
	tex_data[0].y = tex_data[0].x * saturate_coeff * ((float)TONE_MAP_SAT_GAMMA_SAMPLES / UV.x / 512) * (1.0f - saturation);
	return tex_data[0].xyxy;
}

float4 ps_screen(vs_out i, float2 UV : TEXCOORD0) : COLOR0
{	
  return tex2D(ScnSamp, UV).xyzw;
}
//============================================================================//
float4 ClearColor = {1, 1, 1, 0};
float ClearDepth  = 1.0;
//============================================================================//
//  Technique(s)  : 
technique SSS <
	string Script = 
		"RenderColorTarget0=;"
		"ClearSetColor=ClearColor;"
		"ClearSetDepth=ClearDepth;"

		"RenderColorTarget0=g_expand; Pass=Expand;"
		"RenderColorTarget0=AnisoTex; Pass=Aniso;"
		"RenderColorTarget0=g_tonemap; Pass=Ramp;"
					
		"RenderColorTarget0=;"
        "RenderDepthStencilTarget=;"
        "Pass=Screen;"
	;
> {
	pass Expand < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 vs_model();
        PixelShader = compile ps_3_0 ps_expand();
	}
	pass Aniso < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 vs_model();
        PixelShader = compile ps_3_0 ps_aniso();
	}
	pass Ramp < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 vs_model();
        PixelShader = compile ps_3_0 ps_tonemap();
	}
	pass Screen < string Script= "Draw=Buffer;"; > {
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 vs_model();
        PixelShader = compile ps_3_0 ps_screen();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////
