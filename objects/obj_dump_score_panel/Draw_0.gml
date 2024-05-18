draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

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
	draw_text(x + first_column, _y, "Perfect!");
	draw_text(x + third_column, _y, string(haul_bonus));
}
_y += line_width;
draw_text(x + first_column, _y, "Total");
draw_text(x + third_column, _y, string(total_points));