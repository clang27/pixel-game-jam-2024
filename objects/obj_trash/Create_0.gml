obj_trash_manager.trash_count++;

particle_timer = 0;
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
highlighted = false;
image_index = 0;
letgo = false;

goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
target_scale = 1;
drag_growth_scale = 1.25;

in_texel = shader_get_uniform(sh_outline, "in_texel");
outline_pixel_width = shader_get_uniform(sh_outline, "pixel_width");
outline_color = shader_get_uniform(sh_outline, "color");

data = {
	type: id.type,
	points: id.original_reward,
	size: 1,
	weight: id.weight
}

#region Particles
	part_type = part_type_create();
	part_type_two = part_type_create();

	part_type_sprite(part_type, spr_water, false, true, true); // Set sprite for particles
	part_type_size(part_type, 1 * data.size, 1.4 * data.size, -0.04, 0); // Set particle size
	part_type_speed(part_type, 0.7, 1.4, -0.052, 0); // Set particle speed
	part_type_direction(part_type, 0, 360, 0, 5); // Set particle direction
	part_type_life(part_type, game_get_speed(gamespeed_fps) * 0.8, game_get_speed(gamespeed_fps) * 1.4);
	part_type_gravity(part_type, 0.02, 50);
	part_type_alpha2(part_type, 1, 0.8);

	part_type_sprite(part_type_two, spr_water_1, false, true, true); // Set sprite for particles
	part_type_size(part_type_two, 1 * sqrt(data.size), 1 * sqrt(data.size), 0, 0); // Set particle size
	part_type_speed(part_type_two, 0.03, 0.04, -0.005, 0); // Set particle speed
	part_type_life(part_type_two, game_get_speed(gamespeed_fps) * 0.1, game_get_speed(gamespeed_fps) * 0.2);
	part_type_scale(part_type_two, 1, 0.9 + (data.size*0.15));

	part_system_bg = part_system_create_layer("Whirlpools", false);
	part_system_fg = part_system_create_layer("Trash", false);
	part_garbage = ds_list_create();

	play_particles_background = function(_x, _y, _pt, _pc, _throw_away = true) {
		part_particles_create(part_system_bg, _x, _y, _pt, _pc);
	
		if (_throw_away) {
			obj_particle_manager.throw_away_particle(_pt);
		}
	}

	play_particles_foreground = function(_x, _y, _pt, _pc, _depth, _throw_away = true) {
		part_system_angle(part_system_fg, degtorad(image_angle));
		part_system_depth(part_system_fg, _depth);
		part_particles_create(part_system_fg, _x, _y, _pt, _pc);
	
		if (_throw_away) {
			obj_particle_manager.throw_away_particle(_pt);
		}
	}
#endregion


would_be_too_big = function(_upgrades_amount) {
	return data.size + _upgrades_amount > max_upgrades;
}

upgrade_size = function(_weight_amount, _upgrade_amount) {
	data.size += _upgrade_amount;
	weight += _weight_amount;

	image_index = data.size - 1;
	goal_y_velocity = drift_speed / (4 * sqrt(sqrt(weight)));
	part_type_size(part_type, 1 * data.size, 1.4 * data.size, -0.04, 0); // Set particle size
	part_type_size(part_type_two, 1 * sqrt(data.size+1), 1 * sqrt(data.size+1), 0, 0); // Set particle size
	part_type_scale(part_type_two, 1, 0.9 + (data.size*0.15));
}