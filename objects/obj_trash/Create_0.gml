obj_trash_manager.trash_count++;

dragging = false;
drag_growth_speed = 20;
drag_speed = 20;
deceleration = 7;
x_velocity = 0;
y_velocity = 0;
goal_x_velocity = 0;
mouse_over = false;
disabled = false;
start_depth = depth;
max_upgrades = 4;
upgrades = 1;

target_scale = (upgrades * 0.5) + 0.5;
goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
drag_growth_scale = target_scale + 0.25;
reward = original_reward * upgrades;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");


would_be_too_big = function(_upgrades_amount) {
	return upgrades + _upgrades_amount > max_upgrades;
}

upgrade_size = function(_weight_amount, _upgrade_amount) {
	upgrades += _upgrade_amount;
	weight += _weight_amount;

	target_scale = (upgrades * 0.5) + 0.5;
	goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
	drag_growth_scale = target_scale + 0.25;
	reward = original_reward * upgrades;
}

currently_dragging_anything = function() {
	with(obj_trash) {
		if (dragging) {
			return true;
		}
	}
	
	return false;
}