disabled = false;
max_whirlpools = 1;
num_of_whirlpools = 0;

spawn_min_x = 64;
spawn_max_x = room_width - 64 - GAMEPLAY_MARGIN_RIGHT;
spawn_min_y = 128;
spawn_max_y = (room_height - 64 - GAMEPLAY_MARGIN_BOTTOM) / 2;

whirlpool_gap = 256;


spawn_whirlpools = function() {
	if (num_of_whirlpools >= max_whirlpools) {
		return;
	}
	
	num_of_whirlpools++;
	
	var _x1 = irandom_range(spawn_min_x, spawn_max_x);
	var _x2 = irandom_range(spawn_min_x, spawn_max_x);
	var _y1 = irandom_range(spawn_min_y, spawn_max_y);
	var _y2 = irandom_range(spawn_min_y, spawn_max_y);
	var _rng = random_range(5,20);
	
	while(too_close_to_other_whirlpool(_x1, _y1)) {
		_x1 = irandom_range(spawn_min_x, spawn_max_x);
		_y1 = irandom_range(spawn_min_y, spawn_max_y);
	}
	
	var _wp1 = instance_create_layer(_x1, _y1, "Whirlpools", obj_whirlpool);
	
	while(too_close_to_other_whirlpool(_x2, _y2)) {
		_x2 = irandom_range(spawn_min_x, spawn_max_x);
		_y2 = irandom_range(spawn_min_y, spawn_max_y);
	}
	
	var _wp2 = instance_create_layer(_x2, _y2, "Whirlpools", obj_whirlpool);
	
	_wp1.entrance = true;
	_wp1.partner = _wp2;
	_wp1.image_blend = c_blue;
	_wp1.active_period = _rng;
	
	_wp2.entrance = false;
	_wp2.partner = _wp1;
	_wp2.image_blend = c_orange;
	_wp2.active_period = _rng;
}

too_close_to_other_whirlpool = function(_x, _y) {
	var _gap = whirlpool_gap;
	
	with (obj_whirlpool) {
		if (distance_to_point(_x, _y) <= _gap) {
			return true;
		}
	}
	
	return false;
}

get_random_interval = function() {
	var _a = 35;
	var _b = obj_level_manager.timer / 1_000_000;
	var _c = game_get_speed(gamespeed_fps);
	var _int = clamp(_c * (random(_a/2) + _a - _b), 600, 3000);
	
	show_debug_message("Next whirlpool in: {0} seconds", string(_int/60));
	return _int;
}