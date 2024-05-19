if (highlighted) {
	shader_set(sh_outline);
	var _texture = sprite_get_texture(sprite_index, image_index);
	var _width = texture_get_texel_width(_texture);
	var _height = texture_get_texel_height(_texture);
	
	shader_set_uniform_f(in_texel, _width, _height);
	shader_set_uniform_f(outline_pixel_width, 2);
	
	if (active) {
		set_outline_color(CYAN, outline_color);
	} else {
		set_outline_color(HOT_PINK, outline_color);
	}
}

draw_self();
shader_reset();