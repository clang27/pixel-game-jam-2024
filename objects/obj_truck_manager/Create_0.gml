spawn_x = obj_truck_placeholder.x;
spawn_y = room_height + sprite_yoffset + 3000;
drive_goal_x = obj_truck_placeholder.x;
drive_goal_y = obj_truck_placeholder.y;
truck_count = 0;
max_trucks = 1;
disabled = false;
driving_up = false;
driving_down = false;

drive_in_speed = 2.1;
y_acceleration = 5;
y_velocity = 0;

max_wild_truck_timer = 8;
current_wild_truck_timer = max_wild_truck_timer;
active_wild_truck = false;

trash_data = ds_list_create();

add_trash_data = function(_data) {
	ds_list_add(trash_data, _data);
}

add_truck = function() {
	truck_count++;
}

remove_truck = function() {
	truck_count--;
}

next_truck = function () {
	if (driving_down || driving_up) { return; }
	
	if (!driving_up && truck_count < max_trucks) {
		spawn_truck(get_random_index());
		obj_spawn_truck_lever.active = false;
		driving_up = true;
	} else if (!driving_down && truck_count == max_trucks) {
		driving_down = true;
		obj_spawn_truck_lever.active = false;
	}
}

spawn_truck = function(_index) {
	var _obj = get_truck_object(_index);

	instance_create_layer(spawn_x, spawn_y, "Trucks", _obj);
}

truck_exists_in_spot_x = function(_x) {
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
		case 4: return obj_wild_truck;
	}
	
	return obj_cardboard_truck;
}

get_random_index = function() {
	var _rng = random(100);
	show_debug_message("Truck RNG: {0}", _rng);
	
	if (current_time < 20000) {
		_rng -= 11;
	}
	
	if (_rng <= 25) {
		return 0;
	} else if (_rng <= 45) {
		return 1;
	} else if (_rng <= 70) {
		return 2;
	} else if (_rng <= 90) {
		return 3;
	}
	
	return 4;
}