dragging = false;
drag_growth_scale = 1.25;
drag_growth_speed = 20;
drag_speed = 10;
deceleration = 7;
x_velocity = 0;
y_velocity = 0;
goal_x_velocity = 0;
goal_y_velocity = 0;
mouse_over = false;
disabled = false;
start_depth = depth;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");

currently_dragging_anything = function() {
	with(obj_draggable) {
		if (dragging) {
			return true;
		}
	}
	
	return false;
}