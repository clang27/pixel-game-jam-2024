#macro GAMEPLAY_MARGIN_RIGHT 200
#macro GAMEPLAY_MARGIN_BOTTOM 80

timer = 0;
wave_timer = 0;
current_points = 0;
most_points = 0;

ocean_layer_id = layer_get_id("Ocean");
ocean_start_x = layer_get_x(ocean_layer_id);
ocean_start_y = layer_get_y(ocean_layer_id);
ocean_x_speed = 5;
ocean_y_amplitude = 20;
disabled = false;

get_base_y_velocity = function() {
	return 0.3 + timer/1000;
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