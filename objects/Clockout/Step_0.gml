if (point_distance(x,y,Shopkeeper.x,Shopkeeper.y) < 10) {
	inRange = true;	
} else inRange = false;

if (keyboard_check_pressed(ord("E")) && inRange || keyboard_check_pressed(ord("E")) && open) {
	open = !open;
	if (room == RoomTutorial && Tutorial.step == 9 && !Tutorial.checkVisable) {
		tutorialCheck(W/2,H/2);
	}
}

if (!inRange)
	open = false;

if (ringBuf > 0) ringBuf--;
if (ringBuf > 0) image_speed = 1;
	else {
		image_speed = 0;
		image_index = 0;
	}
depth = -bbox_bottom;

if (ceil(((global.time/40)/60)) == 4 && !ring4) {
	ringBuf = 30;
	ring4 = true;
	playSound(sfxAlarm,3);
}
if (ceil(((global.time/40)/60)) == 3 && !ring3) {
	ringBuf = 30;
	ring3 = true;
	playSound(sfxAlarm,3);
}
if (ceil(((global.time/40)/60)) == 2 && !ring2) {
	ringBuf = 30;
	ring2 = true;
	playSound(sfxAlarm,3);
}
if (ceil(((global.time/40)/60)) == 1 && !ring1) {
	ringBuf = 30;
	ring1 = true;
	playSound(sfxAlarm,3);
}
if (ceil(((global.time/40)/60)) == 0 && !ring0) {
	ringBuf = 30;
	ring0 = true;
	playSound(sfxAlarm,3);
	scMusicChange(2);
}
