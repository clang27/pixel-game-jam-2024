if(disabled) {return;}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(BLACK);
draw_set_font(fnt_fat_24);
var _cp = floor(current_points);
var _str = string(_cp);
draw_text((obj_trash_manager.spawn_max_x - obj_trash_manager.spawn_min_x) / 2, room_height - 13, string_repeat("0", score_length-string_length(_str)) + _str);

if (!obj_game_manager.debug_mode) return;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(20, room_height - 10, "Base Speed: " + string(get_base_y_velocity()));

draw_line(room_width - GAMEPLAY_MARGIN_RIGHT, 0, room_width - GAMEPLAY_MARGIN_RIGHT, room_height-GAMEPLAY_MARGIN_BOTTOM);
draw_line(0, room_height-GAMEPLAY_MARGIN_BOTTOM, room_width - GAMEPLAY_MARGIN_RIGHT, room_height-GAMEPLAY_MARGIN_BOTTOM);
draw_set_color(c_red);
draw_line(0, get_death_y(), room_width, get_death_y());