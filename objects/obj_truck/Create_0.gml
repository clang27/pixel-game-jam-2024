obj_truck_manager.add_truck();

trash_hovering_correctly = false;
trash_hovering_incorrectly = false;
drag_growth_scale = 1.05;
drag_growth_speed = 40;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");

disabled = false;
icon_offset = 120;

trash_holding = 0;
trash_max_hold = irandom_range(3,6);

would_be_too_big = function(_amount) {
	return trash_holding + _amount > trash_max_hold;
}

add_trash = function(_amount) {
	trash_holding += _amount;
}