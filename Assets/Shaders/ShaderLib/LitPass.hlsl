#ifndef MYRP_LITPASS
#define MYRP_LITPASS

#include "Assets/Shaders/ShaderLib/Common.hlsl"
#include "Assets/Shaders/ShaderLib/Surface.hlsl"
#include "Assets/Shaders/ShaderLib/Light.hlsl"
#include "Assets/Shaders/ShaderLib/BRDF.hlsl"
#include "Assets/Shaders/ShaderLib/Lighting.hlsl"



float _Metallic;
float _Smoothness;

TEXTURE2D(_BaseMap);
SAMPLER(sampler_BaseMap);

struct VertexInput {
    float4 posOS : POSITION;
    float3 normalOS:NORMAL;
    float2 uv : TEXCOORD0;
};

struct VertexOutput {
    float4 posCS : SV_POSITION;
    float2 uv: TEXCOORD0;
    float4 posWS:TEXCOORD1;
    float3 normalWS:TEXCOORD2;
};

VertexOutput LitPassVertex (VertexInput input) {
    VertexOutput output;
    float4 worldPos = mul(UNITY_MATRIX_M, float4(input.posOS.xyz, 1.0));
    output.posWS = worldPos;
    output.posCS = mul(unity_MatrixVP, worldPos);
    output.uv = input.uv;
    output.normalWS = TransformObjectToWorldNormal(input.normalOS);
    return output;
}

float4 LitPassFragment (VertexOutput input) : SV_TARGET {
    float4 albedo = _Color * SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, input.uv);
    Surface surface = GetSurface(albedo, input.posWS, input.normalWS, _Metallic, _Smoothness);
    BRDF brdf = GetBRDF(surface);
    float3 color = GetLighting(surface, brdf);
    return float4(color, 1);
}

#endif 