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
	obj_whirlpool_manager.disabled = true;
	obj_whirlpool_manager.alarm[0] = -1;
	obj_dump_score_panel.disabled = true;
	
	prior_button_state = obj_spawn_truck_button.active
	obj_spawn_truck_button.active = false;
	
	with(obj_trash) {
		dragging = false;
		disabled = true;
	}
	
	with(obj_truck) {
		disabled = true;
	}
	
	with(obj_wall) {
		disabled = true;
	}
	
	with(obj_whirlpool) {
		disabled = true;
	}
}

enable_all = function() {
	obj_trash_manager.disabled = game_is_over;
	obj_truck_manager.disabled = game_is_over;
	obj_level_manager.disabled = game_is_over;
	obj_whirlpool_manager.disabled = game_is_over;
	obj_dump_score_panel.disabled = game_is_over;
	obj_spawn_truck_button.active = prior_button_state && !game_is_over;
	
	with(obj_trash) {
		disabled = obj_game_manager.game_is_over;
	}
	
	with(obj_truck) {
		disabled = obj_game_manager.game_is_over;
	}
	
	with(obj_wall) {
		disabled = obj_game_manager.game_is_over;
	}
	
	with(obj_whirlpool) {
		disabled = obj_game_manager.game_is_over;
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

obj_truck_manager.next_truck();