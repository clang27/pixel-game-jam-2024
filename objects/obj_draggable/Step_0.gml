var _dt = delta_time / 1000000;

#region Check Mouse
	if (dragging && !mouse_check_button(mb_left)) {
		dragging = false;
	}
#endregion

#region Drag Position
	var _half_width = sprite_width / 2;
	var _half_height = sprite_height / 2;
		
	if(dragging) {	
		var _coastline_height = 70;
		
		var _goal_x = clamp(mouse_x, _half_width, room_width - _half_width);
		var _goal_y = clamp(mouse_y, 0, room_height - _half_height - _coastline_height);
		
		x = lerp(x, _goal_x, _dt * drag_speed);
		y = lerp(y, _goal_y, _dt * drag_speed);
		x_velocity = clamp(x - xprevious, -30, 30);
		y_velocity = clamp(y - yprevious, -30, 30);
	} else {
		x += x_velocity;
		y += y_velocity;
		x_velocity = lerp(x_velocity, goal_x_velocity, _dt * deceleration);
		y_velocity = lerp(y_velocity, goal_y_velocity * (obj_level_manager.level / 2), _dt * deceleration);
		
		x = clamp(x, _half_width, room_width - _half_width);
		y = clamp(y, -_half_width - 5, room_height);
	}
#endregion

#region Drag Angle
	var _sign = sign(x_velocity)
	var _x_diff = abs(x_velocity);
	var _y_diff = abs(y_velocity);
	var _angle = (_x_diff + _y_diff) * _sign * 2;
	image_angle = lerp(image_angle, _angle, _dt * drag_speed);
#endregion

#region Drag Scale
	var _goal_value = dragging ? drag_growth_scale : 1.0;

	image_xscale = lerp(image_xscale, _goal_value, _dt * drag_growth_speed);
	image_yscale = lerp(image_yscale, _goal_value, _dt * drag_growth_speed);
#endregion

#region Depth
	depth = start_depth - (image_yscale - 1.0);
	if (obj_trash_manager.last_touched == id) {
		depth -= 5;
	}
#endregion