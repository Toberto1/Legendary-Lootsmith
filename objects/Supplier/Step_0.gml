if (point_distance(x,y,Shopkeeper.x,Shopkeeper.y) < 16) 
	inRange = true;
else inRange = false;

if (keyboard_check_pressed(ord("E")) && inRange || keyboard_check_pressed(ord("E")) && open) {
	open = !open;
	if (!open) {
		Shopkeeper.state = STATE.FREE;
		playSound(close,3);
	} else playSound(openComputer,3);
	selected = 0;
	typeSelected = 0;
	
		
	
}
	
if (global.paused) {
	check = false;
	open = false;
	Shopkeeper.state = STATE.FREE;
}

if (open) {
	
	

	
	
	Shopkeeper.state = STATE.INTERACTING;
	var list = listArr;
	switch (typeSelected) {
		case 0: list = listArr; break;
		case 1: list = listArr2; break;
		case 2: list = listArr3; break;
	}
	if (global.guiRight && (typeSelected + 1) < 3) {typeSelected++;selected = 0; playSound(sfxMoveMenu,3);}
	else if (global.guiLeft && (typeSelected - 1) > -1) {typeSelected--;selected = 0;playSound(sfxMoveMenu,3)}
	
	if (global.guiDown && (selected + 1) < 3) {selected++;playSound(sfxMoveMenu,3);}
	else if (global.guiUp && (selected - 1) > -1) {selected--;playSound(sfxMoveMenu,3)}
	
	if (global.guiSelected && list[selected].cost <= global.money) { //Buy item
		
		list[selected].amount++;
		moneyAddSub(-list[selected].cost)
		purGreenTimer = purGreenTimerMax;
		script_camera_screen_shake(3,10);
		playSound(sfxBuy,3,true);
		
		if (room == RoomTutorial && Tutorial.step == 7 && !Tutorial.checkVisable) {
			if (list == listArr3 && selected == 1) tutorialCheck(W/2,H/2);
		}
	} 
	
	if (global.guiSelected && list[selected].cost > global.money) {
		script_camera_screen_shake(3,20);
	}	
		
	

}
depth = -bbox_bottom;





