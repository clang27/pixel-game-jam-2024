window_set_cursor(cr_none);
image_speed = 0
depth = -2000;

disabled = false;
highlight_list = ds_list_create();
trash_holding = noone;
trash_touch_count = 0;

populate_trash = function() {
	ds_list_clear(highlight_list);
	trash_touch_count = collision_circle_list(x, y, 16, obj_trash, true, true, highlight_list, true);
}

touching_trash = function() {
	return trash_touch_count > 0;
}

get_closest_trash = function() {
	return highlight_list[|0];
}