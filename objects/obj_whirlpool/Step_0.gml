if (disabled) { alarm[0] = alarm[0] + game_get_speed(gamespeed_fps); return; }

var _dt = delta_time / 1000000;
var _id = id;

#region Appearing/Disappearing
	if (appearing || disappearing) {		
		var _goal_scale = appearing ? target_scale : 0;
		var _goal_alpha = appearing ? 1 : 0;
		var _grow_speed = _dt * (appearing ? whirlpool_grow_speed : whirlpool_shrink_speed);
		
		image_xscale = lerp(image_xscale, _goal_scale, _grow_speed);
		image_yscale = lerp(image_yscale, _goal_scale, _grow_speed);
		image_alpha = lerp(image_alpha, _goal_alpha, _grow_speed);
		active = appearing && image_xscale > target_scale - (target_scale * 0.1);
		
		if (appearing && image_xscale >= target_scale - (target_scale * 0.01)) {
			image_xscale = target_scale;
			image_yscale = target_scale;
			image_alpha = 1;
			
			alarm[0] = game_get_speed(gamespeed_fps) * active_period;
			appearing = false;
		} else if (disappearing && image_xscale <= 0.02) {
			instance_destroy(id);
			return;
		}
	} 
#endregion

#region Sucking Objects
	if(active) {
		with (obj_trash) {
			var _near_whirlpool = collision_circle(_id.x, _id.y, _id.suck_radius, _id, true, false) != noone;
		
			if (_near_whirlpool) {
				var _center_x = x + (sprite_width/2) - sprite_xoffset;
				var _center_y = y + (sprite_height/2) - sprite_yoffset;
			
				var _direction = degtorad(point_direction(_id.x, _id.y, _center_x, _center_y));
				var _distance = clamp(point_distance(_id.x, _id.y, _center_x, _center_y), 8, infinity);
			
				if (_id.entrance) {
					x_velocity += (cos(_direction) / sqr(_distance / 8)) * -_id.suck_force * _dt / weight;
					y_velocity += (sin(_direction) / sqr(_distance / 8)) * _id.suck_force * _dt / weight;
				}
			}
		}
	}
#endregion

#region Teleporting Objects
	with (obj_trash) {
		var _touching_whirlpool = place_meeting(x, y, _id);
		
		if (_touching_whirlpool && _id.entrance && _id.active && image_xscale <= 0.05) {
			x = _id.partner.x;
			y = _id.partner.y + sprite_height;
			
			show_debug_message("Teleporting {0} to ({1}, {2})", id.data.type, x, y);
			audio_play_sound(snd_whirlpool, 5, false);
		} else if (_touching_whirlpool && !_id.entrance && _id.active && image_xscale >= 0.1) {
			y_velocity += 5 / weight * _dt;
		}
	}
#endregion