if (highlighted) {
	shader_set(sh_outline);
	var _texture = sprite_get_texture(sprite_index, image_index);
	var _width = texture_get_texel_width(_texture);
	var _height = texture_get_texel_height(_texture);
	
	shader_set_uniform_f(in_texel, _width, _height);
	shader_set_uniform_f(outline_pixel_width, 2);
	shader_set_uniform_f(outline_color, 
		!active ? 1.0 : 0.0, 
		active ? 1.0 : 0.0,
		0.0,
		1.0
	);
}

draw_self();
shader_reset();