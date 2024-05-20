event_inherited();

draw_sprite_ext(spr_icons, 0, x, y + icon_offset, 4, 4, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(BLACK);
draw_set_font(fnt_slim_18);
draw_text(x, y+icon_offset+text_offset, string(trash_holding)+"/"+string(trash_max_hold));