function ratingChange(rate){

	with (Main) {
		greenStarAlp = 0.0;
		redStarAlp = 0.0;
	
		if (rate > 0) greenStarAlp = 1.0;
		else redStarAlp = 1.0;
		
		starScale = 1.2;
	}
	
	global.rating += rate;
	global.ratingBuffer += rate;
}