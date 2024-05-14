if (dragging || other.dragging) {return;}

var _dt = delta_time / 1000000;

var _x_sign = sign(x - other.x);
var _x_magnitude = 40 / clamp(abs((x - other.x)), 1, sprite_width);
var _y_sign = sign(y - other.y);
var _y_magnitude = 40 / clamp(abs((y - other.y)), 1, sprite_height);
var _x_force = _x_sign * _x_magnitude;
var _y_force = _y_sign * _y_magnitude;

x_velocity += _x_force * _dt;
other.x_velocity += -_x_force * _dt;

y_velocity += _y_force * _dt;
other.y_velocity += -_y_force * _dt;