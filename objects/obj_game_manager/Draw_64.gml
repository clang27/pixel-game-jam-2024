if (paused) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(WHITE);
	draw_set_font(fnt_fat_24);
	draw_text(room_width/2, room_height/2, "Paused");
} else if (game_is_over) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(WHITE);
	draw_set_font(fnt_fat_32);
	var _message = new_high_score ? "New High Score!" : "Game Over";
	draw_text(room_width/2, room_height/2 - 64, _message);
	draw_set_font(fnt_slim_18);
	draw_text(room_width/2, room_height/2 + 32, "Score: " + string(obj_level_manager.most_points));
	draw_text(room_width/2, room_height/2 + 72, "Hi-Score: " + string(high_score));
	draw_set_font(fnt_fat_24);
	draw_text(room_width/2, room_height - 32, "Press 'R' to Restart");
}