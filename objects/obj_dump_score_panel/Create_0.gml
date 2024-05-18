truck_type = "";
trash_list = ds_list_create();
total_items = 0;
haul_bonus = 0;
total_points = 0;

moving_down = false;
moving_up = false;
move_speed = 3;
wait_time = 3;
disabled = false;

padding_top = 25;
first_column = 25;
second_column = first_column + 100;
third_column = second_column + 40;

line_width = 15;

goal_y = ystart + (12 * 16);

show = function(_truck_type, _trash_list) {
	truck_type = _truck_type;
	ds_list_clear(trash_list);
	ds_list_copy(trash_list, _trash_list);
	moving_down = true;
	
	total_items = 0;
	total_points = 0;
	for(var _i = 0; _i < ds_list_size(trash_list); _i++) {
		var _d = trash_list[|_i];
		total_items += _d.size;
		total_points += (_d.points * _d.size) * ((truck_type == "Any" || truck_type == _d.type) ? 1 : -2);
	}
	
	haul_bonus = obj_level_manager.get_haul_points(_truck_type, _trash_list);
	total_points += haul_bonus;
}

draw_info = function(_trash_type, _y) {	
/*
	data = {
		type: id.type,
		points: id.original_reward,
		size: 1,
		weight: id.weight
	}
*/

	var _count = 0;
	var _points = 0;
	for(var _i = 0; _i < ds_list_size(trash_list); _i++) {
		var _d = trash_list[|_i];
		if (_d.type == _trash_type) {
			_count += _d.size;
			_points += (_d.points * _d.size) * ((truck_type == "Any" || truck_type == _trash_type) ? 1 : -1);
		}
	}
	draw_text(x + first_column, _y, _trash_type);
	draw_text(x + second_column, _y, "x"+string(_count));
	draw_text(x + third_column, _y, "= "+string(_points));
}