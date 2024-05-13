spawn_min_x = 50;
spawn_max_x = room_width - 50;
spawn_min_y = -50;
spawn_max_y = -30;

spawn_trash = function(_index) {
	var _obj = get_trash_object(_index);
	var _x = irandom_range(spawn_min_x, spawn_max_x);
	var _y = irandom_range(spawn_min_y, spawn_max_y);
	
	var _instance = instance_create_layer(_x, _y, "Trash", _obj);
}

get_trash_object = function(_index) {
	switch(_index) {
		case 0: return obj_cardboard;
		case 1: return obj_glass;
		case 2: return obj_metal;
		case 3: return obj_plastic;
	}
	
	return obj_cardboard;
}

spawn_trash(0);
spawn_trash(1);
spawn_trash(2);
spawn_trash(3);