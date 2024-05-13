if(other.object_index == accepted_trash) {
	trash_hovering_correctly = other.dragging;
	if (!trash_hovering_correctly) {
		instance_destroy(other.id);
		obj_score_manager.points += other.reward;
	}
} else {
	trash_hovering_incorrectly = other.dragging;
	if (!trash_hovering_incorrectly) {
		instance_destroy(other.id);
		obj_score_manager.points += other.penalty;
	}
}