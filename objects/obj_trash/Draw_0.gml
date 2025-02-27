var _texture = sprite_get_texture(sprite_index, image_index);
var _width = texture_get_texel_width(_texture);
var _height = texture_get_texel_height(_texture);


highlighted = false;

if (!disabled && mouse_over) {
	shader_set(sh_outline);

	shader_set_uniform_f(in_texel, _width, _height);
	shader_set_uniform_f(outline_pixel_width, 2);
	
	set_outline_color(WHITE);
} else {
	var _id = id;
	with (obj_trash) {
		if (id == _id) continue;
			
		if (dragging || _id.dragging) {
			if (place_meeting(x, y, _id)) {
				shader_set(sh_outline);
				shader_set_uniform_f(in_texel, _width, _height);
				
				if (_id.object_index == object_index && !would_be_too_big(_id.data.size)) {
					shader_set_uniform_f(outline_pixel_width, 2);
					set_outline_color(CYAN);
				} else {
					shader_set_uniform_f(outline_pixel_width, 2);
					set_outline_color(HOT_PINK);
				}
			}
		}
	}
}

if (image_xscale > 0.05) {
	draw_self();
	shader_reset();
	
	if (!obj_game_manager.debug_mode) { return; }
	
	draw_text(x, y + (sprite_yoffset/2), string(depth));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(BLACK);
	draw_text(x, y - (sprite_yoffset/2), string(weight));
} else {
	shader_reset();
}