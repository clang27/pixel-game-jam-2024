event_inherited();

var _scale = 3;
var _offset = icon_offset - 15;
var _space = 32;

draw_sprite_ext(spr_icons, 3, x, y + _offset - _space, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_icons, 2, x, y + _offset, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_icons, 1, x, y + _offset + _space, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_icons, 0, x, y + _offset + (_space * 2), _scale, _scale, 0, c_white, 1);
