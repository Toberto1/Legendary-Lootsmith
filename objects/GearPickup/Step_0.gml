if (point_distance(x,y,Shopkeeper.x,Shopkeeper.y) < 10 && Shopkeeper.y < y) {
	inRange = true;	
} else inRange = false;

if (keyboard_check_pressed(ord("E")) && inRange || keyboard_check_pressed(ord("E")) && open) {
	open = !open;
	selected = 0;
	if (next(-1) != -1) selected = next(-1);
	if (!open) Shopkeeper.state = STATE.FREE;
	script_camera_screen_shake(1,1);
	playSound(sfxCloseInventory,3,true);
}

function next (s) {
	for (var i = s+1; i < 9; i++) {
		if (global.gearAmounts[i] != 0)
			return i;
	}
	return -1;
}
function prev (s) {
	for (var i = s-1; i > -1; i--) {
		if (global.gearAmounts[i] != 0)
			return i;
	}
	return -1;
}


if (open) {
	image_index = 1;
	Shopkeeper.state = STATE.INTERACTING;
	
	if (global.guiRight && (selected + 1) < 9 && next(selected) != -1) selected = next(selected);
	else if (global.guiLeft && (selected - 1) > -1 && prev(selected) != -1) selected = prev(selected);
	
	if (global.guiSelected && global.gearAmounts[selected] > 0) {
		global.itemHeld = selected;	
		open = false;
		Shopkeeper.state = STATE.FREE;
		if (room == RoomTutorial && Tutorial.step == 8 && !Tutorial.checkVisable) {
			if (selected == 7) tutorialCheck(W/2,H/2);
		}
		
		
	}
} else image_index = 0;
depth = -bbox_bottom;