#ifndef MYRP_LITPASS
#define MYRP_LITPASS

#include "Assets/Shaders/ShaderLib/Common.hlsl"

TEXTURE2D(_BaseMap);
SAMPLER(sampler_BaseMap);

struct VertexInput {
    float4 pos : POSITION;
    float2 uv : TEXCOORD0;
};

struct VertexOutput {
    float4 clipPos : SV_POSITION;
    float2 uv: TEXCOORD0;
};

VertexOutput LitPassVertex (VertexInput input) {
    VertexOutput output;
    float4 worldPos = mul(UNITY_MATRIX_M, float4(input.pos.xyz, 1.0));
    output.clipPos = mul(unity_MatrixVP, worldPos);
    output.uv = input.uv;
    return output;
}

float4 LitPassFragment (VertexOutput input) : SV_TARGET {
    float4 albedo = _Color * SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, input.uv);
    return albedo;
}

#endif 