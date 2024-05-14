current_points = 0;
most_points = 0;

add_points = function(_a) {
	current_points += _a;
	if (current_points > most_points) {
		most_points = current_points;
	}
	
	obj_level_manager.check_level(current_points);
}