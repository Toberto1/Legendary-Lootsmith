depth = -bbox_bottom;
if (point_distance(x,y,Shopkeeper.x,Shopkeeper.y) < 10) {
	inRange = true;	
} else inRange = false;

if (keyboard_check_pressed(ord("E")) && inRange) {
	global.shopOpen = !global.shopOpen;
	for (var i = 0; i < 5; i++) ds_list_set(global.lineList,i,noone);
	with(Customer) {
		if (state != CUSTOMER.LEAVINGSTORE && state != CUSTOMER.ROB) {
				inLine = false;
				state = CUSTOMER.LOOKINGFORSPOT;
		}
	}
	if (global.time > 0 && global.shopOpen && !audio_is_playing(oMusic.music[0])) 
		scMusicChange(0);
	global.startTimer = false;
	if (room == RoomTutorial && Tutorial.step == 10 && !Tutorial.checkVisable) 
		tutorialCheck(W/2,H/2);
	if (room == RoomTutorial && Tutorial.step == 13 && !Tutorial.checkVisable) 
		tutorialCheck(W/2,H/2);
	
	playSound(sfxOpenCloseSign,5,true);
	
	if (global.shopOpen == false) {
		with (Customer) {
			animationTrack = 0;	
		}
	}
}

if (global.requirements || global.time <= 0) {
	global.shopOpen = false;	
}
if (global.shopOpen) {
	if (image_index < 4) 
		image_speed = 1; 
	else {
		image_speed = 0;
		image_index = 4;
	}
	
}else {
	if (image_index > 1) 
		image_speed = -1; 
	else {
		image_speed = 0;
		image_index = 0;
	}
	
}



