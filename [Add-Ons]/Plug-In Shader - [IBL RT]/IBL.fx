/////////////////////////////////////////////////////////////////////////////////

float4 ClearColor = {0,0,0,0};
float ClearDepth  = 1.0;

float Script : STANDARDSGLOBAL <
	string ScriptOutput = "color";
	string ScriptClass = "scene";
	string ScriptOrder = "postprocess";
> = 0.8;

float2 ViewportSize : VIEWPORTPIXELSIZE;
static float2 ViewportOffset = (float2(0.5,0.5)/ViewportSize);

texture2D DepthBuffer : RENDERDEPTHSTENCILTARGET <
	string Format = "D24S8";
>;


texture2D ScnMap : RENDERCOLORTARGET <
	float2 ViewportRatio = {1.0f, 1.0f};
	int MipLevels = 1;
	string Format = "A16B16G16R16F";
>;

sampler2D ScnSamp = sampler_state {
	texture = <ScnMap>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

texture2D IBL_RT : OFFSCREENRENDERTARGET
<
    string Description = "Alpha Mask RT";
	float2 ViewportRatio = {1.0f, 1.0f};
    float4 ClearColor = {1.0f, 1.0f, 1.0f, 1.0f};
    float ClearDepth = 1.0f;
	int Miplevels = 1;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	"*= Resources/IBL_RT.fx;";
>;
sampler2D IBLRT_Sampler = sampler_state {
    texture = <IBL_RT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

texture2D Specular_RT : OFFSCREENRENDERTARGET
<
    string Description = "Alpha Mask RT";
	float2 ViewportRatio = {1.0f, 1.0f};
    float4 ClearColor = {1.0f, 1.0f, 1.0f, 1.0f};
    float ClearDepth = 1.0f;
	int Miplevels = 1;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	"*= Resources/Specular_RT.fx;";
>;
sampler2D SpecularRT_Sampler = sampler_state {
    texture = <Specular_RT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

texture2D Irradiance_RT : OFFSCREENRENDERTARGET
<
    string Description = "Alpha Mask RT";
	float2 ViewportRatio = {1.0f, 1.0f};
    float4 ClearColor = {1.0f, 1.0f, 1.0f, 1.0f};
    float ClearDepth = 1.0f;
	int Miplevels = 1;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	"*= Resources/Irradiance_RT.fx;";
>;
sampler2D IrradianceRT_Sampler = sampler_state {
    texture = <Irradiance_RT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

shared texture2D IBLRT : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;

shared texture2D SpecularRT : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;

shared texture2D IrradianceRT : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;

/////////////////////////////////////////////////////////////////////////////////
//Vertex Shader
struct VS_OUTPUT {
	float4 Pos			: POSITION;
	float2 Tex			: TEXCOORD0;
    float4 RTPos		: TEXCOORD1; // Vertex Color
};

VS_OUTPUT SceneVS( float4 Pos : POSITION, float4 Tex : TEXCOORD0, float4 RTPos : TEXCOORD1)
{
	VS_OUTPUT Out = (VS_OUTPUT)0; 
	
	Out.Pos = Pos;
	Out.Tex = Tex + ViewportOffset;
    Out.RTPos = Out.Pos;
	
	return Out;
}

///////////////////////////////////////////////////////////////////////////////////
//IBL Pixel Shader

float4 IBLPS(VS_OUTPUT IN) : COLOR0
{   
    float4 scene = tex2D(ScnSamp,IN.Tex);
	scene.rgb = float3(1,1,1);
	
	float2 RTPos1;
    RTPos1.x				= (IN.RTPos.x / IN.RTPos.w)*0.5+0.5;
	RTPos1.y				= (-IN.RTPos.y / IN.RTPos.w)*0.5+0.5;
	
    float4 IBL_RT = tex2D(IBLRT_Sampler, RTPos1);
	
	scene.rgb = lerp(scene.rgb, scene.rgb * IBL_RT.rgb, 1);
	
    return scene;
}
/////////////////////////////////////////////////////////////////////////////////
//Specular Pixel Shader

float4 SPPS(VS_OUTPUT IN) : COLOR0
{   
    float4 scene = tex2D(ScnSamp,IN.Tex);
	scene.rgb = float3(1,1,1);
	
	float2 RTPos1;
    RTPos1.x				= (IN.RTPos.x / IN.RTPos.w)*0.5+0.5;
	RTPos1.y				= (-IN.RTPos.y / IN.RTPos.w)*0.5+0.5;
	
    float4 Specular_RT = tex2D(SpecularRT_Sampler, RTPos1);
	
	scene.rgb = lerp(scene.rgb, scene.rgb * Specular_RT.rgb, 1);
	
    return scene;
}

/////////////////////////////////////////////////////////////////////////////////
//Irradiance Pixel Shader

float4 IRPS(VS_OUTPUT IN) : COLOR0
{   
    float4 scene = tex2D(ScnSamp,IN.Tex);
	scene.rgb = float3(1,1,1);
	
	float2 RTPos1;
    RTPos1.x				= (IN.RTPos.x / IN.RTPos.w)*0.5+0.5;
	RTPos1.y				= (-IN.RTPos.y / IN.RTPos.w)*0.5+0.5;
	
    float4 Irradiance_RT = tex2D(IrradianceRT_Sampler, RTPos1);
	
	scene.rgb = lerp(scene.rgb, scene.rgb * Irradiance_RT.rgb, 1);
	
    return scene;
}

/////////////////////////////////////////////////////////////////////////////////
float4 ScreenPS(VS_OUTPUT IN, float2 UV : TEXCOORD0) : COLOR0
{	
  return tex2D(ScnSamp, UV).xyzw;
}
/////////////////////////////////////////////////////////////////////////////////
technique RTT <
	string Script = 
		
		"RenderColorTarget0=;"
		"RenderDepthStencilTarget=;"
		"ClearSetColor=ClearColor;"
		"ClearSetDepth=ClearDepth;"
		"Clear=Color;"
		"Clear=Depth;"
		"Pass=IBLRT;"
		
		//IBL
		"RenderColorTarget0=IBLRT; Pass=IBLRT;"
		
		//Specular
		"RenderColorTarget0=SpecularRT; Pass=SRT;"
		
		//Irradiance
		"RenderColorTarget0=IrradianceRT; Pass=IRT;"
		
		"RenderColorTarget0=;"
        "RenderDepthStencilTarget=;"
        "Pass=Screen;"
		;
	
> {
	//IBL
	pass IBLRT < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 IBLPS();
	}
	
	//Specular
	pass SRT < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 SPPS();
	}
	
	//Irradiance
	pass IRT < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 IRPS();
	}
	
	pass Screen < string Script= "Draw=Buffer;"; > {
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 ScreenPS();
	}	
}
/////////////////////////////////////////////////////////////////////////////////
