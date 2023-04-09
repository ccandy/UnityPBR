Shader "PBR/Lit"
{
    Properties
    {
        _BaseMap ("Texture", 2D) = "white" {}
        _Color("Color", color) = (1,1,1)
        
        _Metallic ("Metallic", Range(0, 1)) = 0
		_Smoothness ("Smoothness", Range(0, 1)) = 0.5
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            HLSLPROGRAM
            #pragma vertex LitPassVertex
            #pragma fragment LitPassFragment

           
            #include "Assets/Shaders/ShaderLib/LitPass.hlsl"
            ENDHLSL
        }
    }
}
