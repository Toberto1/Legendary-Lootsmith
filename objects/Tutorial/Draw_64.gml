

function tutorialText(_x,_y,_string,charPerLine) {
	
	
	draw_set_font(Font2);
	draw_set_halign(fa_left);
	var charPerLineTemp = 0;
	
	finalString = "";
	for (var i = 1; i <= string_length(_string); i++) {
		charPerLineTemp++;
		if (charPerLineTemp >= charPerLine && string_char_at(_string,i) == " ") {
			finalString += "\n";
			charPerLineTemp = 0;
		}
		else finalString += string_char_at(_string,i)
	}
	draw_set_alpha(0.4 * textBoxAlp);
	draw_sprite_stretched(box,0,_x,_y,string_width(finalString)+8,string_height(finalString)+6);
	draw_set_alpha(0.9 * textBoxAlp);
	draw_text_ext(_x+5,_y+3,finalString,13,1000);
}
if (!checkVisable) textBoxAlp = lerp (textBoxAlp,1.0,0.1);
	else textBoxAlp = checkMarkAlp;
draw_set_alpha(beginAlp);
draw_set_color(c_black);
draw_rectangle(0,0,W,H,false);
draw_set_halign(fa_middle);
draw_set_font(Font2);
		
draw_set_color(c_white);
draw_text_transformed(W/2,H/2-H/5,str,strScale,strScale,0);
		
draw_set_alpha(spaceAlp);
if (spaceAlpBegin && spaceAlp > 0) spaceAlp -= 0.04;
if (step == 0) draw_text(W/2,H-20,"Hold (space) to continue");

draw_set_alpha(1.0);
if (nextBut && set ) {
	if (step < 6 || step > 14) {	
		var w = nextTimer / nextTimerMax;
		var _x = W/2 - 8;
		draw_rectangle(_x,H-25,_x+(w*15),H-20,false);
		draw_sprite(tutorialSpaceBar,0,W/2,H-25);
	}
	
}

if (step == 6) {
	var frameSpeed = (sprite_get_speed(moveTutorial)/60);
	moveTutorialFrame += frameSpeed;
	if (Main.dayX < -100) moveTutorialFrameAlp+=0.01;
	draw_sprite_ext(moveTutorial,moveTutorialFrame,W/2,H/2+40,1,1,0,c_white,moveTutorialFrameAlp);
	
}
if (step == 7) {
	tutorialText(W/2+10,H/2-20,
	"The computer on the left desk serves as a platform for you to make item purchases for selling purposes. To get some practice, try purchasing Vampire Blood from the computer.",
	25)
}
if (step == 8) {
	tutorialText(W/2+5,H/2-20,
	"All of the items that you purchase are stored inside the box on the front desk. You can pull one item out at a time by pressing the (enter) button on the desired item selected. Get the Vampire Blood",
	30)
}
if (step == 9) {
	tutorialText(3,3,
	"On the right desk, you'll find a clock that allows you to check the remaining time before the shop closes. Feel free to interact with it to see how much time is left. Additionally, the clock will ring every hour that passes by, helping you keep track of the time during your operation.",
	30)
}
if (step == 10) {
	tutorialText(3,3,
	"To open and close the shop, you can interact with the sign near the door. You can do this at any time during your shift to buy more stock or to have a temporary break. Open the shop to continue.",
	23)
}
if (step == 11) {
	tutorialText(3,3,
	"When in close proximity to a customer, you can view their request. Press (enter) to provide them with an item. The red bar above them will slowly empty while they're waiting. If this bar empties, they will leave the store and give a negative review, so be quick!",
	24)
}
if (step == 12) {
	tutorialText(3,3,
	"Some customers are dishonest and will attempt to steal half of your coins from your gold chest. You can spot thieves from their evil emotions. Press (space) to tackle them.",
	23)
}
if (step == 13) {
	tutorialText(3,3,
	"To increase your star rating, it's important to fulfill customers' exact desires. Providing something close to their request won't affect the rating, but failing to match their request entirely will result in a negative review. Close the store to proceed.",
	25)
}
if (step == 14) {
	tutorialText(3,3,
	"This concludes your training day. You can now leave the store.",
	20)
}

if (checkMarkAlp > 0) {
	checkMarkAlp -= 0.02;
	localCheckX = W/2;
	localChecky = H/2;
	draw_sprite_ext(checkMarkSym,0,localCheckX,localChecky,1,1,0,c_white,checkMarkAlp);	
}
if (checkVisable && checkMarkAlp <= 0) {
	checkVisable = false;
	step++;
	textBoxAlp = 0.0;
	set = true;
}



draw_set_halign(fa_left);