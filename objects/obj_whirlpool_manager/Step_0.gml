if (disabled) { return; }

if (alarm[0] <= 0) {
	alarm[0] = get_random_interval();
}