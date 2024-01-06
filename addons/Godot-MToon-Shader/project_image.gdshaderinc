uniform sampler2D project_texture : source_color, hint_default_white, filter_linear;

//#include "./gauss_blur.gdshaderinc"

vec3 color_mix(vec3 base, vec3 overlay)
{
	return base*overlay;
}

vec3 project(vec3 base_color, vec2 screen_uv)
{
	screen_uv = clamp(screen_uv, vec2(0,0), vec2(1,1));
	vec3 tex_col = texture(project_texture, screen_uv).rgb;
	return color_mix(base_color, tex_col);
}