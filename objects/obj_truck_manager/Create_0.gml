spawn_xs = [room_width/7, 2*room_width/7, 3*room_width/7, 4*room_width/7, 5*room_width/7, 6*room_width/7];
spawn_y = room_height + sprite_get_height(spr_cardboard_truck) + 50;
drive_goal_y = room_height - (sprite_get_height(spr_cardboard_truck) / 3);
truck_count = 0;
max_trucks = 5;
disabled = false;

spawn_truck = function(_index) {
	var _obj = get_truck_object(_index);
	var _x = spawn_xs[irandom_range(0, array_length(spawn_xs) - 1)];
	var _y = spawn_y;
	
	while(truck_exists_in_spot(_x)) {
		_x = spawn_xs[irandom_range(0, array_length(spawn_xs) - 1)];
	}
	
	var _instance = instance_create_layer(_x, _y, "Trucks", _obj, {goal_y: drive_goal_y, image_angle: 180});
}

truck_exists_in_spot = function(_x) {
	with(obj_truck) {
		if (abs(_x - x) < 5) {
			return true;
		}
	}
	
	return false;
}

get_truck_object = function(_index) {
	switch(_index) {
		case 0: return obj_cardboard_truck;
		case 1: return obj_plastic_truck;
		case 2: return obj_glass_truck;
		case 3: return obj_metal_truck;
	}
	
	return obj_cardboard_truck;
}

get_random_index = function() {
	var _rng = random(100);
	show_debug_message("Truck RNG: {0}", _rng);
	
	if (_rng < 40) {
		return 0;
	} else if (_rng < 60) {
		return 1;
	} else if (_rng < 80) {
		return 2;
	}
	
	return 3;
}

get_random_interval = function() {
	var _a = 4 + sqrt(obj_level_manager.level);
	var _c = game_get_speed(gamespeed_fps);
	
	return clamp(_c * (random(_a) + _a), 120, 1200);
}