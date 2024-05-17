if (obj_game_manager.game_is_over) return;

if (y >= obj_level_manager.get_death_y()) {
	obj_game_manager.game_over();
}