shader_type canvas_item;

uniform float v_res: hint_range(0.0, 1080.0, 1.0) = float(1080.0);
uniform float h_res: hint_range(0.0, 1920.0, 1.0) = float(1920.0);

uniform float boost : hint_range(1.0, 3.0, 0.1) = float(1.0);

uniform bool scanlines = true;
uniform float sl_opacity: hint_range(0.0, 1.0, 0.1) = float(0.5);
uniform float sl_blur: hint_range(-1.0, 2.0, 0.1) = float(0.0);

uniform bool grid = true;
uniform float grid_width: hint_range(0.0, 20.0, 0.1) = float(8.0);

uniform bool rgb = true;
uniform float blur: hint_range(0.0, 10.0, 0.1) = float(0.0);

void fragment() {
	
	float pi = 3.1416;
	//vec3 color = texture(SCREEN_TEXTURE, SCREEN_UV).rgb;
	vec3 color = vec3(textureLod(SCREEN_TEXTURE, SCREEN_UV, log(blur)).r,
						textureLod(SCREEN_TEXTURE, SCREEN_UV, log(blur)).g,
						textureLod(SCREEN_TEXTURE, SCREEN_UV, log(blur)).b);
	
	float opacity = 1.0;
	
	
	if (rgb) {
		float r_col = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5) * pi)), 0.0, 1.0);
		float g_col = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5 - (1.0 / 3.0)) * pi)), 0.0, 1.0);
		float b_col = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5 - (2.0 / 3.0)) * pi)), 0.0, 1.0);
		if (r_col == 1.0){color = vec3(color.r, 0.0, 0.0);}
		if (g_col == 1.0){color = vec3(0.0, color.g, 0.0);}
		if (b_col == 1.0){color = vec3(0.0, 0.0, color.b);}
	}
	
	if (grid) {
		float grid_col_r = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5) * pi) - exp(10.0 - grid_width)), 0.0, 1.0);
		if (grid_col_r == 1.0) {color = vec3(0.0, 0.0, 0.0);}
		if (rgb) {
			float grid_col_g = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5 - (1.0 / 3.0)) * pi) - exp(10.0 - grid_width)), 0.0, 1.0);
			if (grid_col_g == 1.0) {color = vec3(0.0, 0.0, 0.0);}
			float grid_col_b = clamp(sign(tan(5.0 * pi / 6.0) - tan((h_res * UV.x + 0.5 - (2.0 / 3.0)) * pi) - exp(10.0 - grid_width)), 0.0, 1.0);
			if (grid_col_b == 1.0) {color = vec3(0.0, 0.0, 0.0);}			
		}
	}
	
	if (scanlines) {
		opacity = clamp(sl_opacity * (sin(v_res * 2.0 * pi * UV.y) + sl_blur) / (1.0 + sl_blur), 0.0, 1.0);
		color *= (1.0 - opacity);
	}
	
	color *= boost;
	
	COLOR = vec4(color.r, color.g, color.b, 1.0);
}
