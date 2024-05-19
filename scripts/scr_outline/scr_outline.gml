function set_outline_color(_c){
	var _r = color_get_red(_c) / 255;
	var _g = color_get_green(_c) / 255;
	var _b = color_get_blue(_c) / 255;
	
	shader_set_uniform_f(outline_color, _r, _g, _b, 1.0);
}