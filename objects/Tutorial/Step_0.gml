if (step < 6 || step > 14) {
	nextBut = keyboard_check(vk_space);
	if (keyboard_check_pressed(vk_space)) playSound(sfxMoveMenu,3,true);
	if (nextBut && set) {
		nextTimer++; 
		if (!spaceAlpBegin) spaceAlpBegin = true;
	}

	if (nextTimer >= nextTimerMax) {
		step++;
		nextTimer = 0;
		strScale = 1.2;
		set = false;
		playSound(openComputer,3,true);
	}
	if (keyboard_check_released(vk_space)) {
		nextTimer = 0;
		set = true;
	}
	strScale = lerp(strScale,1.0,0.1);
	switch (step) {
	
		case 0: str = "You are a shopkeeper."; break;	
		case 1: str = "Instead of following the cliche path\nof becoming a brave warrior you have decided\nto become a lootsmith instead."; break;	
		case 2: str = "The goal of each day will be to\nachive a good star review."; break;
		case 3: str = "Each day will have a limited amount\nof time to get a good review.\nIf the store rating becomes too low,\nthe shop will be forced to close and the day will end early."; break;
		case 4: str = "Most customers are honest individuals and have kind souls.\nHowever, others have evil intent and will try\nto steal from the shop."; break;	
		case 5: str = "Today will be for teaching you how to sell\nitems and deal with dishonest customers."; break;
		case 15: str = "Remember: your money at the end of\n a day does not affect the final score."; break;
		case 16: str = "Remember: The items that customers request\nare random and can be hard to predict."; break;
		case 17: str = "Remember: The items that customers request\nare random and can be hard to predict."; break;
	}
}
if (step == 6 && Main.dayX < -100) {
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")))
		movementLeft = true;
	if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")))
		movementRight = true;
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		movementUp = true;
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("S")))
		movementDown = true;
}
if (movementDown && movementLeft && movementRight && movementUp && step == 6 && !checkVisable) {
	tutorialCheck(W/2,H/2);
}

if (step > 5 && beginAlp > 0 && step < 14) {
	beginAlp -= 0.04;
	Shopkeeper.state = STATE.FREE;
} else if (step <= 5 ) Shopkeeper.state = STATE.INTERACTING;
if (step > 14 && beginAlp < 1.0) {
	beginAlp += 0.04;
	Shopkeeper.state = STATE.INTERACTING;
} 
if (step == 17 && !tra) {
	global.ratingScore = global.rating;
		transition(ScoreScreen);
	tra = true;
}



