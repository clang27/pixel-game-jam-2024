if (game_is_over) {
	if (keyboard_check(ord("R"))) {
		audio_stop_all();
		room_restart();
	}
}