shader_type spatial;

void fragment() {
	ALBEDO.r *= sin(TIME) * 0.1;
	ALBEDO.b *= cos(TIME) * 0.1;
	ALBEDO.g = ALBEDO.r * ALBEDO.b;
	METALLIC *= ALBEDO.g;
}
