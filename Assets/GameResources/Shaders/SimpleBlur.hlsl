void ApplyGaussianBlur_float(UnityTexture2D sprite, UnitySamplerState sampleState, float2 uv, float2 texelSize, int iterations, out float4 rgba)
{

    rgba = SAMPLE_TEXTURE2D(sprite, sampleState, uv);

    if(iterations <=0)
        return;

    for (int iter = 0; iter < iterations; iter++)
        for (int x = -2; x <= 2; x++)
            for (int y = -2; y <= 2; y++)
                rgba += SAMPLE_TEXTURE2D(sprite, sampleState, uv + float2(x, y) * texelSize);

    rgba /= (25.0 * float(iterations));
}