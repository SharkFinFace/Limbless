shader_type spatial;

uniform float scale = 0.1;
uniform float speed = 1.0;
uniform float intensity = 1.0;
uniform float closeness = 1.0;
uniform float repeat = 1.0;
uniform sampler2D texture : hint_albedo;

void fragment() {
    vec2 uv = UV * repeat;
    float time = TIME * speed;

    float sine_x = sin(uv.y * closeness + time) * intensity;
    float sine_y = sin(uv.x * closeness + time) * intensity;

    vec2 warped_uv = uv + vec2(sine_x, sine_y) * scale;

    warped_uv = fract(warped_uv);

    vec4 color = texture(texture, warped_uv);

    ALBEDO = color.rgb;
    ALPHA = color.a;
}
