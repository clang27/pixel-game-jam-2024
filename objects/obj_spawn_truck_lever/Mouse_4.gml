if (active) {
	sprite_index = spr_lever_pull;
	obj_truck_manager.next_truck();
	audio_play_sound(snd_clunk, 5, false);
}