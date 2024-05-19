for (var _i = 0; _i < ds_list_size(part_garbage); _i++) {
	part_type_destroy(part_garbage[|_i]);
}

ds_list_clear(part_garbage);