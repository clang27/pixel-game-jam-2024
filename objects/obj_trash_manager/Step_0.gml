if (disabled) {return;}

if (trash_count <= max_trash_count) {
	spawn_trash();
}

if (alarm[0] <= 0) {
	alarm[0] = get_random_interval();
}