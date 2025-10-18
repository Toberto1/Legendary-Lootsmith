global.gearAmounts = array_create(9,0);
global.money = 100.00;
global.shopOpen = false;
global.itemHeld = -1;
global.rating = 3;
global.requirements = false;
global.easyBeaten = 0;
global.normalBeaten = 0;
global.hardBeaten = 0;
global.day = 1; 
global.ratingBuffer = 3;
global.bankrupt = false;
global.time = 18000;
global.music_volume = 0.5;
global.sfx_volume = 0.5;
global.startTimer = false;
global.ratingScore = 0.0;
enum DIF {
	EASY,
	NORMAL,
	HARD,
	TUTORIAL
}
gameStartBuf = 10;
global.partSystem = part_system_create();
global.difficulty = DIF.NORMAL;
global.paused = false;
pauseAlp = 0.0;
dayAlp = 1.0
daySpeed = 1;
dayX = W/2;
dayXX = 0;
dayTimer = 60;
//Gui Resolution
display_set_gui_size(320,180);


#macro W 320
#macro H 180

#macro LINE_SPACING 20

moneyAlpha = 0.0;
moneyCol = c_white;

moneyX = 0;
moneySpeed = 0;
currentVal = 0;

redStarAlp = 0.0;
greenStarAlp = 0.0;
starScale = 1.0;


