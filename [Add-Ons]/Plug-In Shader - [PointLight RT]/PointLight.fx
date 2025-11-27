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
	bool AntiAlias = true;
	int MipLevels = 1;
	string Format = "A16B16G16R16F";
>;

sampler2D ScnSamp = sampler_state {
	texture = <ScnMap>;
	MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = LINEAR;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
};

texture2D PL_RT : OFFSCREENRENDERTARGET
<
    string Description = "PointLight RT";
	float2 ViewportRatio = {1.0f, 1.0f};
	float4 ClearColor = {1,1,1,0};
    float ClearDepth = 1.0f;
	int Miplevels = 1;
	string Format = "A16B16G16R16F";
	string DefaultEffect =
	"*= Resources/PointLight_RT.fx;";
>;
sampler2D PLRT_Sampler = sampler_state {
    texture = <PL_RT>;
    MINFILTER = ANISOTROPIC;
    MAGFILTER = ANISOTROPIC;
    MIPFILTER = ANISOTROPIC;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
	ADDRESSW  = WRAP;
	MAXANISOTROPY = 16;
};

shared texture2D PointLight : RENDERCOLORTARGET <
	bool AntiAlias = true;
	string Format = "A16B16G16R16F";
>;

/////////////////////////////////////////////////////////////////////////////////
//Vertex Shader
struct VS_OUTPUT {
	float4 Pos			: POSITION;
	float2 Tex			: TEXCOORD0;
    float4 RTPos		: TEXCOORD1;
};

VS_OUTPUT SceneVS( float4 Pos : POSITION, float4 Tex : TEXCOORD0, float4 Tex1 : TEXCOORD1)
{
	VS_OUTPUT Out = (VS_OUTPUT)0; 
	
	Out.Pos = Pos;
    Out.RTPos = Out.Pos;
	
	return Out;
}

/////////////////////////////////////////////////////////////////////////////////// Pixel Shader

float4 ScenePS(VS_OUTPUT IN) : COLOR0
{   
    float4 scene = float4(0,0,0,1);
	
	float2 RTPos1;
    RTPos1.x				= (IN.RTPos.x / IN.RTPos.w)*0.5+0.5;
	RTPos1.y				= (-IN.RTPos.y / IN.RTPos.w)*0.5+0.5;
	
    float3 PL = tex2D(PLRT_Sampler, RTPos1);
	
	scene.rgb += PL.rgb;
	
    return lerp(scene, scene, scene);
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
		
		"RenderColorTarget0= PointLight; Pass=RT;"
		
		"RenderColorTarget0=;"
        "RenderDepthStencilTarget=;"
        "Pass=RT;"
		;
	
> {
	pass RT < string Script= "Draw=Buffer;"; > {
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
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
