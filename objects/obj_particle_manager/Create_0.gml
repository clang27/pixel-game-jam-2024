part_system = part_system_create();
part_garbage = ds_list_create();

throw_away_particle = function (_part) {
	ds_list_add(part_garbage, _part);
	alarm[0] = game_get_speed(gamespeed_fps) * 2;
}

play_particles = function(_points, _pt, _pc, _throw_away = false) {
	for (var _i = 0; _i < array_length(_points); _i++) {
		part_particles_create(part_system, _points[_i].x_coord, _points[_i].y_coord, _pt, _pc);
	}
	
	if (_throw_away) {
		throw_away_particle(_pt);
	}
}