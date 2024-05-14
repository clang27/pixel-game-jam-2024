level = 1;
timer = 0;

check_level = function(_points) {
	if ((level == 1 && _points >= 100) || 
		(level == 2 && _points >= 200) || 
		(level == 3 && _points >= 400) || 
		(level == 4 && _points >= 800) || 
		(level == 5 && _points >= 1600)) {
			level_up();
	}
}

level_up = function() {
	level++;
	timer = 0;
}