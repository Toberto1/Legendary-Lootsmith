	
	if (global.requirements && !set) {
		set = true;
		if (global.difficulty == DIF.EASY) {
			if (global.rating > global.easyBeaten) global.easyBeaten = global.rating;
		}
		else if (global.difficulty == DIF.NORMAL) {
			if (global.rating > global.normalBeaten) global.normalBeaten = global.rating;
		}
		else if (global.difficulty == DIF.HARD) {
			if (global.rating > global.hardBeaten) global.hardBeaten = global.rating;
		}
		global.day++;
		global.ratingScore = global.rating;
		transition(ScoreScreen);
		
	}
	if (room == RoomTutorial && Tutorial.step == 14 && !Tutorial.checkVisable) {
			tutorialCheck(W/2,H/2);
		}
