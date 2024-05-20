#region Particles
	if(!dragging && abs(image_xscale-target_scale) < 0.2 && floor(particle_timer * 4) % 2 == 0 && y < obj_level_manager.get_death_y() - sprite_height/6) {
		var _y1 = y - (data.size * 1.8) - 16;
		
		play_particles_background(x, _y1, part_type, 30);
	}
	if(!dragging && abs(image_xscale-target_scale) < 0.2 && !highlighted && y <  obj_level_manager.get_death_y() - sprite_height / 1.8) {
		var _y2 = y + (data.size * 4) - 4;
		
		play_particles_foreground(x, _y2, part_type_two, 1, depth - 1);
	}
#endregion

if (obj_game_manager.game_is_over) return;

if (y >= obj_level_manager.get_death_y()) {
	obj_game_manager.game_over();
}