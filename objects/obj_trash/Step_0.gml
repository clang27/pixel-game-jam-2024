if (disabled) return;

var _dt = delta_time / 1000000;
var _id = id;
var _mouse_x = obj_cursor.x;
var _mouse_y = obj_cursor.y;

particle_timer += _dt;

#region Check Mouse		
	if (dragging && letgo) {
		dragging = false;
		letgo = false;
	
		// If let go onto truck, score appropriate points
		with(obj_truck) {
			if (place_meeting(x, y, _id) && !would_be_too_big(_id.data.size)) {
				add_trash(_id.data.size);
				obj_truck_manager.add_trash_data(_id.data);
				
				part_system_clear(_id.part_system_bg);
				part_system_clear(_id.part_system_fg);
				part_system_destroy(_id.part_system_bg);
				part_system_destroy(_id.part_system_fg);
				
				if (accepted_trash == "Any" || _id.type == accepted_trash) {
					audio_play_sound(snd_correct_trash, 20, false);
				} else {
					audio_play_sound(snd_wrong_trash, 20, false);
				}
				
				instance_destroy(_id);
				return;
			}
		}
		
		// If let go onto another trash, upgrade
		with (obj_trash) {
			if (id == _id) continue;
			
			if (place_meeting(x, y, _id) && _id.object_index == object_index  && !would_be_too_big(_id.data.size)) {
				upgrade_size(_id.weight, _id.data.size);
				image_xscale = _id.image_xscale;
				image_yscale = _id.image_yscale;
				image_angle = _id.image_angle;
				x_velocity = _id.x_velocity / 8;
				y_velocity = _id.y_velocity / 8;
				
				audio_play_sound(snd_powerup, 20, false);
				
				part_system_clear(_id.part_system_bg);
				part_system_clear(_id.part_system_fg);
				part_system_destroy(_id.part_system_bg);
				part_system_destroy(_id.part_system_fg);
				instance_destroy(_id);
				return;
			}
		}
		
		audio_play_sound(snd_splash, 20, false);
	}
#endregion

#region Drag Position
	var _half_width = sprite_width / 2;
	var _half_height = sprite_height / 2;
	var _offedge = false;
		
	if(dragging) {			
		var _goal_x = clamp(_mouse_x + (-sprite_xoffset + _half_width), _half_width, room_width - _half_width);
		var _goal_y = clamp(_mouse_y + (-sprite_yoffset + _half_height + _half_height), 0, room_height - _half_height - GAMEPLAY_MARGIN_BOTTOM);
		
		x = lerp(x, _goal_x, _dt * (drag_speed / weight));
		y = lerp(y, _goal_y, _dt * (drag_speed / weight));
		x_velocity = clamp(x - xprevious, -30, 30);
		y_velocity = clamp(y - yprevious, -30, 30);
		
		_offedge = x >= room_width - _half_width - GAMEPLAY_MARGIN_RIGHT;
	} else {
		x += x_velocity;
		y += y_velocity;
		x_velocity = lerp(x_velocity, goal_x_velocity, _dt * deceleration);
		y_velocity = lerp(y_velocity, goal_y_velocity * obj_level_manager.get_base_y_velocity(), _dt * deceleration);
		
		x = clamp(x, _half_width, room_width - _half_width - GAMEPLAY_MARGIN_RIGHT);
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
	var _size_change_from_whirlpool = false;
	
	if (!dragging) {
		with (obj_whirlpool) {
			var _touching_whirlpool = place_meeting(x, y, _id);
		
			if (_touching_whirlpool && active && !entrance) {
				_id.image_xscale = lerp(_id.image_xscale, _id.target_scale, _dt * trash_grow_speed);
				_id.image_yscale = lerp(_id.image_yscale, _id.target_scale, _dt * trash_grow_speed);
				_size_change_from_whirlpool = true;
			} else if (_touching_whirlpool && active && entrance) {			
				_id.image_xscale = lerp(_id.image_xscale, 0, _dt * trash_shrink_speed);
				_id.image_yscale = lerp(_id.image_yscale, 0, _dt * trash_shrink_speed);
				_size_change_from_whirlpool = true;
			}
		}
		
		if (_size_change_from_whirlpool) {
			delay_growth = true;
			alarm[0] = game_get_speed(gamespeed_fps) * 0.4;
		} else if (!delay_growth) {
			image_xscale = lerp(image_xscale, target_scale, _dt * drag_growth_speed / 8);
			image_yscale = lerp(image_yscale, target_scale, _dt * drag_growth_speed / 8);
			if (abs(image_xscale - target_scale) < 0.02) {
				image_xscale = target_scale;
				image_yscale = target_scale;
			}
		} 
	} else {
		image_xscale = lerp(image_xscale, drag_growth_scale, _dt * drag_growth_speed);
		image_yscale = lerp(image_yscale, drag_growth_scale, _dt * drag_growth_speed);
	}
#endregion

#region Depth
	depth = start_depth - ((image_yscale - 1.0)*200) - y;
	depth = ceil(depth);
#endregion