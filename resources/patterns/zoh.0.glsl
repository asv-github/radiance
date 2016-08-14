// Zero order hold to the beat

void main(void) {

    vec4 prev = texture2D(iChannel[0], v_uv);
    vec4 next = texture2D(iFrame, v_uv);

    float t = pow(2, round(6 * iIntensity - 4));
    float a = float((iIntensity >= 0.09) && (mod(iTime,t) >= 0.1));
    f_color0 = mix(next, prev, a);
}