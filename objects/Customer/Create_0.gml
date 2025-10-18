randomize();

enum CUSTOMER {
	LOOKINGFORSPOT,
	GOINGTOSPOT,
	WAITING,
	LEAVINGSTORE,
	ROB,
	BEINGTACKLED
}
state = CUSTOMER.LOOKINGFORSPOT;
inLine = false;
travelSpeed = random_range(0.3,0.3);
posInLine = -1;


request = choose(0,0,0,6,6,6,7,7,7,8,8,8,1,2,3,4,5);
inRange = false;
z = 0;
emotion = 1;

animationTrack = 0;
robTimer = 300;
var chance = irandom_range(0,5);
if (chance == 0)robber = true; else robber = false;

route = choose (1,2);

maybeRobTimer = 300;
localFrame = 0;
image_speed = 0;
image_index = irandom_range(1,image_number-1)

for (var i = 0; i < instance_number(Customer); i++) {
    var _customer = instance_find(Customer,i);
	while (_customer != noone && _customer.id != id && _customer.image_index == image_index)
		image_index = irandom_range(1,image_number-2);
}

hsp = 0;
vsp = 0;
grv = 0.1;
zsp = 0;
patientTimer = 100;

if (global.difficulty == DIF.EASY) {
	switch (ceil((global.time/60)/60)) {
		case 5: patientTimer = 400; break;
		case 4: patientTimer = 300; break;
		case 3: patientTimer = 290; break;
		case 2: patientTimer = 280; break;
		case 1: patientTimer = 270; break;
	}
	var chance = irandom_range(0,3);
	if (chance == 0)robber = true; else robber = false;
	travelSpeed = random_range(0.3,0.6);
}
else if (global.difficulty == DIF.NORMAL) {
	switch (ceil((global.time/60)/60)) {
		case 5: patientTimer = 200; break;
		case 4: patientTimer = 180; break;
		case 3: patientTimer = 160; break;
		case 2: patientTimer = 140; break;
		case 1: patientTimer = 120; break;
	}
	var chance = irandom_range(0,5);
	if (chance == 0)robber = true; else robber = false;
	travelSpeed = random_range(0.6,0.7);
}
else if (global.difficulty == DIF.HARD) {
	switch (ceil((global.time/60)/60)) {
		case 5: patientTimer = 110; break;
		case 4: patientTimer = 100; break;
		case 3: patientTimer = 90; break;
		case 2: patientTimer = 80; break;
		case 1: patientTimer = 50; break;
	}
	var chance = irandom_range(0,7);
	if (chance == 0)robber = true; else robber = false;
	travelSpeed = random_range(1.0,1.1);
	maybeRobTimer = 60;
}
else if (global.difficulty == DIF.TUTORIAL) 
	patientTimer = 1000;

patientTimerMax = patientTimer;