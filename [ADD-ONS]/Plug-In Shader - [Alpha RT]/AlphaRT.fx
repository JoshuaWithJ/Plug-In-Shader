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

texture2D ALPHA_RT : OFFSCREENRENDERTARGET
<
    string Description = "Alpha Mask RT";
	float2 ViewportRatio = {1.0f, 1.0f};
    float4 ClearColor = {1.0f, 1.0f, 1.0f, 1.0f};
    float ClearDepth = 1.0f;
	int Miplevels = 1;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	"*= Resources/Alpha - Off.fx;";
>;
sampler2D AlphaMaskSampler = sampler_state {
    texture = <ALPHA_RT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

shared texture2D AlphaMaskRT : RENDERCOLORTARGET <
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

/////////////////////////////////////////////////////////////////////////////////// Pixel Shader

float4 ScenePS(VS_OUTPUT IN) : COLOR0
{   
    float4 scene = tex2D(ScnSamp,IN.Tex);
	
	float2 RTPos1;
    RTPos1.x				= (IN.RTPos.x / IN.RTPos.w)*0.5+0.5;
	RTPos1.y				= (-IN.RTPos.y / IN.RTPos.w)*0.5+0.5;
    float4 AlphaMask = tex2D(AlphaMaskSampler, RTPos1);
	
	scene.rgb = AlphaMask;
	scene.a = AlphaMask;
	float Alpha = AlphaMask;
	
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
		"Pass=RT;"
		
		"RenderColorTarget0=AlphaMaskRT; Pass=RT;"
		
		"RenderColorTarget0=;"
        "RenderDepthStencilTarget=;"
        "Pass=Screen;"
		;
	
> {
	pass RT < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = TRUE; ZWriteEnable = TRUE;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 ScenePS();
	}
	pass Screen < string Script= "Draw=Buffer;"; > {
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SceneVS();
        PixelShader = compile ps_3_0 ScreenPS();
	}	
}
/////////////////////////////////////////////////////////////////////////////////
