draw_set_alpha(1.0);
draw_set_halign(fa_middle);
draw_set_font(Font3);

blackBorder(W/2,50,"Final Score");

draw_set_color(c_white);
draw_text(W/2,50,"Final Score");
var _space = 16;
if (frac(global.ratingScore) == 0) var _x = W/2 - (floor(global.ratingScore) * _space)/2;
	else var _x = W/2 - (floor(global.ratingScore+1) * _space)/2;
	
_x += 8;

var _y = H/2;
var _space = 16;

if (--aniBuffer <= 0 && starCurrent < floor(global.ratingScore)+2) {
	aniBuffer = aniBufferMax;
	starCurrent++;
	if (starCurrent == floor(global.ratingScore)+1 && frac(global.ratingScore) == 0) starCurrent++;
	playSound(goodDeal,10,true);
	if (starCurrent <= floor(global.ratingScore)+1) scale = 2;
}
scale = lerp(scale,1.0,0.3);

if (starCurrent >= floor(global.ratingScore)) keep = true;
if (starCurrent <= floor(global.ratingScore) && !keep) 
	for (var i = 0; i < starCurrent; i++) {
		if (i == starCurrent-1) draw_sprite_ext(star2,0,_x + (_space * i), _y,scale,scale,0,c_white,1.0);	
			else draw_sprite(star2,0,_x + (_space * i), _y);
	}
if (keep) 
	for (var i = 0; i < floor(global.ratingScore); i++) {
		if (i == floor(global.ratingScore)-1 && starCurrent <= floor(global.ratingScore)) draw_sprite_ext(star2,0,_x + (_space * i), _y,scale,scale,0,c_white,1.0);	
			else draw_sprite(star2,0,_x + (_space * i), _y);
	}
	
if (starCurrent >= floor(global.ratingScore)+1) {
	if (frac(global.ratingScore) == 0.25)
		draw_sprite_ext(star2,2,_x + (_space * floor(global.ratingScore)), _y,scale,scale,0,c_white,1.0);		
	else if (frac(global.ratingScore) == 0.50)
		draw_sprite_ext(star2,3,_x + (_space * floor(global.ratingScore)), _y,scale,scale,0,c_white,1.0);	
	else if (frac(global.ratingScore) == 0.75)
		draw_sprite_ext(star2,4,_x + (_space * floor(global.ratingScore)), _y,scale,scale,0,c_white,1.0);
}
global.ratingScore = clamp (global.ratingScore,0,5);

var col = c_white;
if (flash == 0) col = c_white;
if (flash == 1) col = #ff5ebf;
if (flash == 2) col = c_yellow;


if (--flashBuf <= 0) {
	flashBuf = flashBufMax;
	if (flash < 2) flash++;
		else flash = choose(1,0);
}
if (floor(global.ratingScore) == 0 && starCurrent >= 1 && frac(global.ratingScore) == 0)
	draw_sprite_ext(star2,1,W/2, _y,scale,scale,0,c_white,1.0);
if (starCurrent == floor(global.ratingScore)+2) {
	blackBorder(W/2,H/2+30,"Good Job!\nYou got a rating of "+string(global.ratingScore)+" stars");
	draw_set_color(col);
	draw_text(W/2,H/2+30,"Good Job!\nYou got a rating of "+string(global.ratingScore)+" stars");
	
	animationDone = true;
}


