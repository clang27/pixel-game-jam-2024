x = mouse_x;
y = mouse_y;

if (disabled) return;

populate_trash();
with(obj_trash) {
	mouse_over = false;
}

if (touching_trash() && trash_holding == noone) {
	var _trash = get_closest_trash();
	get_closest_trash().mouse_over = true;
}



if (mouse_check_button(mb_left)) {
	image_index = 1;
	
	if(touching_trash() && trash_holding == noone) {
		trash_holding = get_closest_trash();
		trash_holding.dragging = true;
		audio_play_sound(snd_click, 0, false);
		obj_trash_manager.last_touched = trash_holding.id;
	}
} else if (mouse_check_button_released(mb_left)) {
	image_index = 0;
	
	if(trash_holding != noone) {
		trash_holding.letgo = true;
		trash_holding = noone;
	}
}
