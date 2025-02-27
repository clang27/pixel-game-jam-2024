#macro HOT_PINK #ba41d9
#macro PURPLE #6c29a6
#macro DARK_BLUE #281d73
#macro WHITE #dae7f2
#macro CYAN #73c7e5
#macro BLACK #111126

function play_game_audio() {
	audio_play_sound(snd_night_life, 5, true);
}

play_game_audio();

game_is_over = false;
paused = false;
prior_button_state = false;
high_score = 0;
new_high_score = false;

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
	obj_cursor.disabled = true;
	
	prior_button_state = obj_spawn_truck_lever.active
	obj_spawn_truck_lever.active = false;
	
	with(obj_trash) {
		dragging = false;
		disabled = true;
	}
	
	with(obj_truck) {
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
	obj_spawn_truck_lever.active = prior_button_state && !game_is_over;
	obj_cursor.disabled = game_is_over;
	
	with(obj_trash) {
		disabled = obj_game_manager.game_is_over;
	}
	
	with(obj_truck) {
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
	new_high_score = save_high_score(obj_level_manager.most_points) == true;
}

save_high_score = function(_score) {
	if (_score > high_score) {
		ini_open("data.ini");
	    ini_write_real("data", "highscore", _score);
	    high_score = _score;
		ini_close();
		
		return true;
	}
	
	return false;
}

get_high_score = function() {
	ini_open("data.ini");
	high_score = ini_read_real("data", "highscore", 0);
	ini_close();
}

get_high_score();
obj_truck_manager.next_truck();