////////////////////////////////////////////////////////////////////////////////////////////////

float4 ClearColor
<
   string UIName = "ClearColor";
   string UIWidget = "Color";
   bool UIVisible =  true;
> = float4(0,0,0,0);

///////////////////////////////////////////////////////////////////////////////////


float Script : STANDARDSGLOBAL <
    string ScriptOutput = "color";
    string ScriptClass = "scene";
    string ScriptOrder = "postprocess";
> = 0.8;

float4 MaterialDiffuse : DIFFUSE  < string Object = "Geometry"; >;
static float alpha1 = MaterialDiffuse.a;

float2 ViewportSize : VIEWPORTPIXELSIZE;

static float2 ViewportOffset = (float2(0.5,0.5)/ViewportSize);

float ClearDepth  = 1.0;

texture2D DepthBuffer : RENDERDEPTHSTENCILTARGET <
    float2 ViewPortRatio = {1.0,1.0};
    string Format = "D24S8";
>;

texture2D ScnMap : RENDERCOLORTARGET <
    float2 ViewPortRatio = {1.0,1.0};
    int MipLevels = 1;
    string Format = "A8R8G8B8" ;
>;
sampler2D ScnSamp = sampler_state {
    texture = <ScnMap>;
    MinFilter = LINEAR;
    MagFilter = LINEAR;
    MipFilter = NONE;
    AddressU  = CLAMP;
    AddressV = CLAMP;
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

////////////////////////////////////////////////////////////////////////////////////////////////

struct VS_OUTPUT {
	float4 Pos			: POSITION;
	float2 Tex			: TEXCOORD0;
	float4 RTPos		: TEXCOORD1;
};

VS_OUTPUT VS_passDraw( float4 Pos : POSITION, float4 Tex : TEXCOORD0,float4 RTPos : TEXCOORD1) {
    VS_OUTPUT Out = (VS_OUTPUT)0; 
    
    Out.Pos = Pos;
    Out.Tex = Tex + ViewportOffset;
    Out.RTPos = Out.Pos;
	
    return Out;
}

////////////////////////////////////////////////////////////////////////////////////////////////

float4 PS_Alpha( float2 Tex: TEXCOORD0, float4 RTPos: TEXCOORD1 ) : COLOR {   

    float4 scene = tex2D(ScnSamp,Tex);
	
	float2 RTPos1;
    RTPos1.x				= (RTPos.x / RTPos.w)*0.5+0.5;
	RTPos1.y				= (-RTPos.y / RTPos.w)*0.5+0.5;
    float4 AlphaMask = tex2D(AlphaMaskSampler, RTPos1);
	
	scene.rgb += AlphaMask;
	scene.a *= AlphaMask;
    
    return float4(scene.r,scene.g,scene.b,scene.a);
}

////////////////////////////////////////////////////////////////////////////////////////////////
float4 ScreenPS( float2 UV : TEXCOORD0) : COLOR0
{	
  return tex2D(ScnSamp, UV).xyzw;
}
/////////////////////////////////////////////////////////////////////////////////

technique ColorShift <
    string Script = 
        
        "RenderColorTarget0=ScnMap;"
        "RenderDepthStencilTarget=DepthBuffer;"
        "ClearSetColor=ClearColor;"
        "ClearSetDepth=ClearDepth;"
        "Clear=Color;"
        "Clear=Depth;"
        "ScriptExternal=Color;"
        
		"RenderColorTarget0=AlphaMaskRT;"
		"RenderDepthStencilTarget=DepthBuffer;"
        "ClearSetColor=ClearColor;"
        "ClearSetDepth=ClearDepth;"
        "Clear=Color;"
        "Clear=Depth;"
		"Pass=AlphaPass;"
		
        "RenderColorTarget0=;"
        "RenderDepthStencilTarget=;"
        "ClearSetColor=ClearColor;"
        "ClearSetDepth=ClearDepth;"
        "Clear=Color;"
        "Clear=Depth;"
        "Pass=AlphaPass;"
		
		"RenderColorTarget0=;"
		"RenderDepthStencilTarget=;"
		"Pass=ScreenPass;"
		
    ;
    
> {
    pass AlphaPass < string Script= "Draw=Buffer;"; > {
        AlphaBlendEnable = FALSE;
        VertexShader = compile vs_2_0 VS_passDraw();
        PixelShader  = compile ps_2_0 PS_Alpha();
    }
	pass ScreenPass < string Script= "Draw=Buffer;"; > {
        AlphaBlendEnable = FALSE;
        VertexShader = compile vs_2_0 VS_passDraw();
        PixelShader  = compile ps_2_0 ScreenPS();
    }
}
////////////////////////////////////////////////////////////////////////////////////////////////
