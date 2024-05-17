spawn_x = obj_truck_placeholder.x;
spawn_y = room_height + sprite_yoffset + 1;
drive_goal_x = obj_truck_placeholder.x;
drive_goal_y = obj_truck_placeholder.y;
truck_count = 0;
max_trucks = 1;
disabled = false;

add_truck = function() {
	truck_count++;
	obj_spawn_truck_button.active = truck_count != max_trucks; 
}

remove_truck = function() {
	truck_count--;
	obj_spawn_truck_button.active = truck_count != max_trucks; 
}

next_truck = function () {
	if (truck_count == max_trucks) { return; }
	spawn_truck(get_random_index());
}

spawn_truck = function(_index) {
	var _obj = get_truck_object(_index);

	var _instance = instance_create_layer(spawn_x, spawn_y, "Trucks", _obj, {goal_y: drive_goal_y});
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
	}
	
	return obj_cardboard_truck;
}

get_random_index = function() {
	var _rng = random(100);
	show_debug_message("Truck RNG: {0}", _rng);
	
	if (_rng <= 25) {
		return 0;
	} else if (_rng <= 50) {
		return 1;
	} else if (_rng <= 75) {
		return 2;
	}
	
	return 3;
}