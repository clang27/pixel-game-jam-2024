if (game_is_over) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text(room_width/2, room_height/2, "Game Over");
	draw_text(room_width/2, room_height/2 + 50, "Press 'R' to restart");
}
