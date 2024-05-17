if (disabled) {return;}

var _dt = delta_time / 1000000;

if (disabled) {return;}

#region Drive To Goal
	var _speed = !reached_top_path ? drive_in_speed : drive_out_speed;
	y = lerp(y, goal_y, _speed * _dt);
	
	if (abs(goal_y - y) < 0.01) {
		y = goal_y;
		if (!reached_top_path) {
			reached_top_path = true;
			waiting_at_top_path = true;
			alarm[0] = game_get_speed(gamespeed_fps) * wait_time;
		} else if (!waiting_at_top_path) {
			instance_destroy(id);
		}
	}
#endregion

#region Trash Collision Undetection
	if(!place_meeting(x, y, obj_trash)) {
		trash_hovering_correctly = false;
		trash_hovering_incorrectly = false;
	}
#endregion

#region Drag Scale
	var _goal_value = trash_hovering_correctly || trash_hovering_incorrectly ? 
		drag_growth_scale : 1.0;

	image_xscale = lerp(image_xscale, _goal_value, _dt * drag_growth_speed);
	image_yscale = lerp(image_yscale, _goal_value, _dt * drag_growth_speed);
#endregion