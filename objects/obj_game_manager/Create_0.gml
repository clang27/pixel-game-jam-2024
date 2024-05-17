function play_game_audio() {
	audio_play_sound(snd_night_life, 5, true);
}

play_game_audio();

game_is_over = false;
paused = false;
prior_button_state = false;

disable_all = function() {
	obj_trash_manager.disabled = true;
	obj_trash_manager.alarm[0] = -1;
	obj_truck_manager.disabled = true;
	obj_truck_manager.alarm[0] = -1;
	obj_level_manager.disabled = true;
	obj_level_manager.alarm[0] = -1;
	
	prior_button_state = obj_spawn_truck_button.active
	obj_spawn_truck_button.active = false;
	
	with(obj_trash) {
		dragging = false;
		disabled = true;
	}
	
	with(obj_truck) {
		disabled = true;
	}
}

enable_all = function() {
	obj_trash_manager.disabled = false;
	obj_truck_manager.disabled = false;
	obj_level_manager.disabled = false;
	obj_spawn_truck_button.active = prior_button_state;
	
	with(obj_trash) {
		disabled = false;
	}
	
	with(obj_truck) {
		disabled = false;
	}
}

pause = function () {
	paused = true;
	disable_all();
}

unpause = function() {
	paused = false;
	enable_all();
}

game_over = function() {
	game_is_over = true;
	disable_all();
}