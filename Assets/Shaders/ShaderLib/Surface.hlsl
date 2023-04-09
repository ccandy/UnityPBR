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

Surface GetSurface(float3 color, float3 worldPos, float3 normal, float metallic, float smoothness)
{
    Surface surface;
    surface.color = color;
    surface.viewDirection = normalize(_WorldSpaceCameraPos - worldPos);
    surface.metallic = metallic;
    surface.smoothness = smoothness;
    surface.normal = normal;
    
    return surface;
}

#endif
