function play_game_audio() {
	audio_play_sound(snd_night_life, 5, true);
}

play_game_audio();

game_is_over = false;

game_over = function() {
	game_is_over = true;
	obj_trash_manager.disabled = true;
	obj_truck_manager.disabled = true;
	
	with(obj_trash) {
		goal_x_velocity = 0;
		goal_y_velocity = 0;
		dragging = false;
		disabled = true;
	}
	
	with(obj_truck) {
		disabled = true;
	}
}