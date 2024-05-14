spawn_min_x = 50;
spawn_max_x = room_width - 50;
spawn_min_y = -50;
spawn_max_y = -30;
trash_count = 0;
last_touched = noone;
disabled = false;

spawn_trash = function(_index = get_random_index(), _x = irandom_range(spawn_min_x, spawn_max_x), _y = irandom_range(spawn_min_y, spawn_max_y)) {
	var _obj = get_trash_object(_index);
	
	var _instance = instance_create_layer(_x, _y, "Trash", _obj);
}

get_trash_object = function(_index) {
	switch(_index) {
		case 0: return obj_cardboard;
		case 1: return obj_plastic;
		case 2: return obj_glass;
		case 3: return obj_metal;
	}
	
	return obj_cardboard;
}

get_random_index = function() {
	var _rng = random(100) + (obj_level_manager.level * 3);
	show_debug_message("Trash RNG: {0}", _rng);
	
	if (_rng < 80) {
		return 0;
	} else if (_rng < 88) {
		return 1;
	} else if (_rng < 96) {
		return 2;
	}
	
	return 3;
}

get_random_interval = function() {
	var _a = 8 - obj_level_manager.level;
	var _b = obj_level_manager.timer / 300_000_000;
	var _c = game_get_speed(gamespeed_fps);
	show_debug_message("{2} * (random({0}) + {0} - {1})", _a, _b, _c);
	
	return clamp(_c * (random(_a) + _a - _b), 6, 600);
}

// Starting trash
spawn_trash(0, irandom_range(spawn_min_x, spawn_max_x), irandom_range(50, 200));
spawn_trash(0, irandom_range(spawn_min_x, spawn_max_x), irandom_range(50, 200));
spawn_trash(0, irandom_range(spawn_min_x, spawn_max_x), irandom_range(50, 200));