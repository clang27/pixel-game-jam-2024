if (disabled) {return;}

if (alarm[0] <= 0 && truck_count < max_trucks) {
	alarm[0] = get_random_interval();
}