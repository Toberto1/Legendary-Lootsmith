timer = 300;
maxCustomer = 5;
if (global.difficulty == DIF.EASY) {
	maxCustomer = 3;
	timerMax = 180;
}
else if (global.difficulty == DIF.NORMAL) {
	maxCustomer = 4;
	timerMax = 120;
}
else if (global.difficulty == DIF.HARD) {
	maxCustomer = 5;
	timerMax = 60;
}
else if (global.difficulty == DIF.TUTORIAL) {
	maxCustomer = 1;
	timerMax = 180;
}
amountC = 0;
tutorialSpawned = false;