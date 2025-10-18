if (room == TitleScreen || room == ScoreScreen) exit;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font (Font2);



draw_set_alpha(1.0);
var rating = global.rating;
var rating_max = 5;
var rating_frac = frac(rating);
rating -= rating_frac;
for (var i = 1; i <= rating_max; i++){
	var _image_index = (i > rating);
	if (i == rating+1) {
		_image_index += (rating_frac > 0);
		_image_index += (rating_frac > 0.25);
		_image_index += (rating_frac > 0.5);	
	}
	draw_sprite_ext(star,_image_index,W/2+W/5 + ((i-1) * 17), H-18,starScale,starScale,0,c_white,1.0);
	
	draw_sprite_ext(starRed,_image_index,W/2+W/5 + ((i-1) * 17), H-18,starScale,starScale,0,c_white,redStarAlp);
	draw_sprite_ext(starGreen,_image_index,W/2+W/5 + ((i-1) * 17), H-18,starScale,starScale,0,c_white,greenStarAlp);
}
if (redStarAlp > 0) redStarAlp -= 0.05;
if (greenStarAlp > 0) greenStarAlp -= 0.05;
starScale = lerp(starScale,1.0,0.1);

draw_set_font(Font2);
draw_set_color(c_white);


var formattedNumber = string(global.money);

	draw_sprite_stretched(box,0,5,H-20,string_width(formattedNumber)+3+sprite_get_width(Coin),15);


draw_sprite(Coin,0,8,H-16);
draw_text(17,H-20,formattedNumber);

col = moneyCol;
if (currentVal >= 0)
	var str = "+"+string(abs(currentVal));
else var str = "-"+string(abs(currentVal));

if (moneyAlpha <= 0.25) currentVal = 0;

draw_set_alpha(moneyAlpha);
blackBorder(15,H-17 - moneyX,str)
draw_text_color(15,H-17- moneyX,str,col,col,col,col,moneyAlpha);
if (moneyAlpha <= 0) moneyX = 0;
moneySpeed = lerp (moneySpeed,0,0.05);
moneyX += moneySpeed;
moneyAlpha -= 0.003;
draw_set_alpha(1.0);

draw_set_halign(fa_middle);
draw_set_font(Font2);
draw_set_alpha(dayAlp);


blackBorder(dayX,H/2,"Day "+string(global.day));
draw_set_color(c_white);
draw_text(dayX,H/2,"Day "+string(global.day));

var difCol = c_white
if (global.difficulty == DIF.EASY) {
	var dif = "Easy";
	difCol=c_lime;
} else if (global.difficulty == DIF.NORMAL) {
	var dif = "Normal";
	difCol=c_orange;
} else if (global.difficulty == DIF.HARD) {
	var dif = "Hard";
	difCol = c_red;
}
else if (global.difficulty == DIF.TUTORIAL) {
	var dif = "Tutorial";
	difCol = #546C96;
}
blackBorder(dayX,H/2+15,dif);
draw_set_color(difCol);
draw_text(dayX,H/2+15,dif);

if (dif == "Tutorial" && Tutorial.step < 6) dayTimer++;
if (--dayTimer <= 0 && !instance_exists(TRANSITION)) {
	dayAlp -= 0.01;
	if (daySpeed > -0.99 ) {
		dayXX+=0.15;
		daySpeed = sin(dayXX) * 2;
	} else
		daySpeed-=0.2;		
	dayX += daySpeed;
}

draw_set_font(1.0);
draw_set_halign(fa_left);

if (global.paused)
	pauseAlp += 0.09;
else 
	pauseAlp -= 0.09;	
	
pauseAlp = clamp(pauseAlp,0.0,0.2);
draw_set_alpha(pauseAlp);
draw_set_color(c_black)
draw_rectangle(0,0,W,H,false);

draw_set_color(c_white);


