#property description Brightly highlight pixels in red where fc.rgb > f.a

void main(void) {
    vec4 c = texture(iInput, uv);
    float a = max(max(c.r,c.g),c.b);

    vec4 black = vec4(0., 0., 0., 1.);
    vec4 red = vec4(1., 0., 0., 1.);
    vec4 highlight = mix(c, red, (a <= c.a ? 0. : 1.));

    fragColor = mix(c, highlight, iIntensity);
}
