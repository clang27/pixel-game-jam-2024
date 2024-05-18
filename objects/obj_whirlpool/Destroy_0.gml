if (entrance) {
	obj_whirlpool_manager.num_of_whirlpools--;
	
	if(instance_exists(partner)) {
		instance_destroy(partner);
	}
}