#macro GAMEPLAY_MARGIN_RIGHT 200
#macro GAMEPLAY_MARGIN_BOTTOM 80

timer = 0;
wave_timer = 0;
current_points = 0;
most_points = 0;
perfect_haul_bonus = 2000;

ocean_layer_id = layer_get_id("Ocean");
ocean_start_x = layer_get_x(ocean_layer_id);
ocean_start_y = layer_get_y(ocean_layer_id);
ocean_x_speed = 5;
ocean_y_amplitude = 20;
disabled = false;

get_base_y_velocity = function() {
	return 0.25 + timer/450;
}

get_death_y = function() {
	var _y = room_height + layer_get_y(ocean_layer_id) + 20;
	return _y;
}

add_points = function(_a) {
	current_points += _a;
	if (current_points > most_points) {
		most_points = current_points;
	}
}

spawn_score_card = function(_truck_type, _trash_list) {
	for (var _i = 0; _i < ds_list_size(_trash_list); _i++) {
		var _t = _trash_list[|_i];
		add_points(((_t.type == _truck_type || _truck_type == "Any") ? _t.points : -_t.points * 2) * _t.size);
	}
	
	add_points(get_haul_points(_truck_type, _trash_list));

	obj_dump_score_panel.show(_truck_type, _trash_list);
}

get_haul_points = function(_truck_type, _trash_list) {
	if (obj_truck.trash_holding < obj_truck.trash_max_hold) {
		return 0;
	}
	
	if (_truck_type == "Any") {
		return perfect_haul_bonus;
	}
	
	for (var _i = 0; _i < ds_list_size(_trash_list); _i++) {
		if (_trash_list[|_i].type != _truck_type) {
			return 0;
		}
	}
	
	return perfect_haul_bonus;
}