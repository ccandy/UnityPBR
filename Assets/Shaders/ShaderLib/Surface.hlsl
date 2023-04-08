#ifndef MYRP_SURFACE_INCLUDED
#define MYRP_SURFACE_INCLUDED


struct Surface {
    float3 normal;
    float3 viewDirection;
    float3 color;
    float alpha;
    float metallic;
    float smoothness;
};

#endif
