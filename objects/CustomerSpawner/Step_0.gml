
if (global.shopOpen) timer--;
if (timer <= 0 && instance_number(Customer) < maxCustomer && global.shopOpen && !global.bankrupt && !global.requirements) {
	
	if (room == RoomTutorial) {
		if (amountC < 2) {
			if (tutorialSpawned)
				with (instance_create_depth(x,y-10,depth,Customer)) {
					robber = true;
					state = CUSTOMER.ROB;
					travelSpeed = 0.2;
				}
			else with (instance_create_depth(x,y,depth,Customer)) {
					robber = false;
					request = 7;
				}
		}
	} else 
		instance_create_depth(x,y,depth,Customer);	
	
	amountC++;
	tutorialSpawned = true;
	timer = timerMax;
}