draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(room_width - 20, room_height - 10, "Score: " + string(current_points));

if (!obj_game_manager.debug_mode) return;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(20, room_height - 10, "Base Speed: " + string(get_base_y_velocity()));

draw_line(room_width - GAMEPLAY_MARGIN_RIGHT, 0, room_width - GAMEPLAY_MARGIN_RIGHT, room_height-GAMEPLAY_MARGIN_BOTTOM);
draw_line(0, room_height-GAMEPLAY_MARGIN_BOTTOM, room_width - GAMEPLAY_MARGIN_RIGHT, room_height-GAMEPLAY_MARGIN_BOTTOM);
draw_set_color(c_red);
draw_line(0, get_death_y(), room_width, get_death_y());