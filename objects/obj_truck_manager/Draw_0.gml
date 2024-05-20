if (active_wild_truck) {
	var _id = id;
	
	with(obj_truck) {
		var _x1 = x - 40;
		var _x2 = x + 40;
		var _y1 = y - sprite_yoffset + sprite_height + 20;
		var _y2 = y - sprite_yoffset + sprite_height + 35;
		
		var _percentage = (_id.current_wild_truck_timer / _id.max_wild_truck_timer) * 100;
		
		draw_healthbar(_x1, _y1, _x2, _y2, _percentage, BLACK, HOT_PINK, CYAN, 0, true, false);
	}
}