obj_trash_manager.trash_count++;

dragging = false;
drag_growth_speed = 10;
drag_speed = 20;
deceleration = 5;
x_velocity = 0;
y_velocity = 0;
goal_x_velocity = 0;
mouse_over = false;
disabled = false;
start_depth = depth;
max_upgrades = 4;
delay_growth = false;

target_scale = 1;
goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
drag_growth_scale = target_scale + 0.25;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");

data = {
	type: id.type,
	points: id.original_reward,
	size: 1,
	weight: id.weight
}

would_be_too_big = function(_upgrades_amount) {
	return data.size + _upgrades_amount > max_upgrades;
}

upgrade_size = function(_weight_amount, _upgrade_amount) {
	data.size += _upgrade_amount;
	weight += _weight_amount;

	target_scale = (data.size * 0.5) + 0.5;
	goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
	drag_growth_scale = target_scale + 0.25;
}

currently_dragging_anything = function() {
	with(obj_trash) {
		if (dragging) {
			return true;
		}
	}
	
	return false;
}