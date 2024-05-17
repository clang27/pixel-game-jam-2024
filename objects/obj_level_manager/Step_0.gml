if (disabled) return;

var _dt = delta_time / 1000000;

timer += _dt;

layer_x(ocean_layer_id, layer_get_x(ocean_layer_id) + ((cos(timer) + 2) * ocean_x_speed * _dt));
layer_y(ocean_layer_id, ocean_start_y + (sin(timer/4) * ocean_y_amplitude));