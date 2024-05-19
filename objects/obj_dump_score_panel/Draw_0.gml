draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(WHITE);
draw_set_font(fnt_slim_12);

var _y = y + padding_top;
draw_info("Cardboard", _y);
_y += line_width;
draw_info("Plastic", _y);
_y += line_width;
draw_info("Glass", _y);
_y += line_width;
draw_info("Metal", _y);
_y += line_width * 2;


if (haul_bonus > 0) {
	draw_set_color(WHITE);
	draw_text(x + first_column, _y, "Perfect!");
	draw_set_halign(fa_right);
	draw_text(x + third_column + 25, _y, string(haul_bonus));
}
_y += line_width;
draw_set_halign(fa_left);
draw_set_color(total_points > -1 ? CYAN : HOT_PINK);
draw_text(x + first_column, _y, "Total");
var _str = string(abs(total_points));
var _sign = total_points > -1 ? "+" : "-";
draw_set_halign(fa_right);
draw_text(x + third_column + 25, _y, _sign + string_repeat("0", score_length-string_length(_str)) + _str);