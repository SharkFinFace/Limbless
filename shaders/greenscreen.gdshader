shader_type spatial;
render_mode unshaded, depth_draw_always;

uniform sampler2D sprite_texture : hint_albedo;
uniform float width;
uniform float height;
uniform bool isSquare;

void fragment() {
    vec2 viewport_size = VIEWPORT_SIZE;
	if ( isSquare ) {
	    float viewport_width = viewport_size.y * width;
	    float viewport_height = viewport_size.y * -height;

	    vec2 uv = FRAGCOORD.xy / vec2(viewport_width, viewport_height);

	    vec4 texture_color = texture(sprite_texture, uv);

	    ALBEDO = texture_color.rgb;
	    ALPHA = texture_color.a;
	} else {
	    float viewport_width = viewport_size.x * width;
	    float viewport_height = viewport_size.y * -height;

	    vec2 uv = FRAGCOORD.xy / vec2(viewport_width, viewport_height);

	    vec4 texture_color = texture(sprite_texture, uv);

	    ALBEDO = texture_color.rgb;
	    ALPHA = texture_color.a;
	}
}
