if (trash_hovering_correctly || trash_hovering_incorrectly) {
	shader_set(sh_outline);
	var _texture = sprite_get_texture(sprite_index, image_index);
	var _width = texture_get_texel_width(_texture);
	var _height = texture_get_texel_height(_texture);
	
	shader_set_uniform_f(in_texel, _width, _height);
	shader_set_uniform_f(outline_pixel_width, 2);
	
	if (trash_hovering_correctly) {
		set_outline_color(CYAN);
	} else if (trash_hovering_incorrectly) {
		set_outline_color(HOT_PINK);
	}
}

draw_self();
shader_reset();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(BLACK);
draw_set_font(fnt_slim_18);
draw_text(x, y+sprite_height, string(trash_holding)+"/"+string(trash_max_hold));