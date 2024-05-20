if (!paused && game_is_over) {
	if (keyboard_check(ord("R"))) {
		audio_stop_all();
		room_restart();
	}
}

if (keyboard_check_pressed(vk_escape) && !game_is_over) {
	if (!paused) {
		pause();
	} else {
		unpause();
	}
}