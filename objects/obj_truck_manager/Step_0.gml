if (disabled) {return;}

var _dt = delta_time / 1000000;
var _id = id;

#region Wild Truck
	if (active_wild_truck) {
		current_wild_truck_timer -= _dt;
		
		if (current_wild_truck_timer <= 0) {
			driving_down = true;
			active_wild_truck = false;
			current_wild_truck_timer = max_wild_truck_timer;
		}
	}
#endregion

#region Drive To Goal
	if (driving_up) {
		with(obj_truck) {
			y = lerp(y, _id.drive_goal_y, _id.drive_in_speed * _dt);
	
			if (abs(_id.drive_goal_y - y) <= 1) {
				y = _id.drive_goal_y;
				_id.driving_up = false;
				
				if (accepted_trash == "Any") {
					_id.active_wild_truck = true;
				} else {
					obj_spawn_truck_button.active = true;
				}
			}
		}
	}
#endregion

#region Drive To Spawn
	if (driving_down) {
		with(obj_truck) {
			_id.y_velocity += _id.y_acceleration * _dt;
			y += _id.y_velocity;
	
			if (_id.spawn_y - y < 0) {
				obj_level_manager.spawn_score_card(accepted_trash, _id.trash_data);
				ds_list_clear(_id.trash_data);
				wild_truck = false;
				y = _id.spawn_y;
				_id.driving_down = false;
				_id.y_velocity = 0;
				instance_destroy(id);
				_id.next_truck();
			}
		}
	}
#endregion