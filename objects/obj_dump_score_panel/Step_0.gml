if(disabled) return;

var _dt = delta_time / 1000000;

#region Move To Goal
	if (moving_down) {
		y = lerp(y, goal_y, move_speed * _dt);
	
		if (abs(goal_y - y) <= 1) {
			y = goal_y;
			moving_down = false;
			alarm[0] = game_get_speed(gamespeed_fps) * wait_time;
		}
	} else if (moving_up) {
		y = lerp(y, ystart, move_speed * _dt);
	
		if (abs(ystart - y) <= 1) {
			y = ystart;
			moving_up = false;
		}
	}
#endregion