if (disabled) return;

var _dt = delta_time / 1000000;

#region Unhighlight
	if (!place_meeting(x, y, obj_trash)) {
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