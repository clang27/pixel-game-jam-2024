if (other.dragging || disabled) {return;}

var _dt = delta_time / 1000000;

var _center_y = y + (sprite_height/2) - sprite_yoffset;
var _other_center_y = other.y + (other.sprite_height/2) - other.sprite_yoffset;
var _y_sign = 1;
var _y_magnitude = 1000 / clamp(abs((_center_y - _other_center_y)), 1, 30);
var _y_force = _y_sign * _y_magnitude;

var _center_x = x + (sprite_width/2) - sprite_xoffset;
var _other_center_x = other.x + (other.sprite_width/2) - other.sprite_xoffset;
var _x_sign = sign(_center_x - _other_center_x);
var _x_magnitude = 500 / clamp(abs((_center_x - _other_center_x)), 4, 64);
var _x_force = _x_sign * _x_magnitude;

other.x_velocity += (-_x_force * _dt) / other.weight;
other.y_velocity += (-_y_force * _dt) / other.weight;