var colFlash = c_white;
if (flash == 0) colFlash = c_white;
if (flash == 1) colFlash = #ff5ebf;
if (flash == 2) colFlash = c_yellow;


if (--flashBuf <= 0) {
	flashBuf = flashBufMax;
	if (flash < 2) flash++;
		else flash = choose(1,0);
}
if (global.paused) {
	draw_sprite_stretched(box,0,W/2-60,5,120,H-10);	
}

var spacing = 20;

var _x = W/2;
var _y = H/2;

var sel = global.guiSelected;

var tempLvl = level;

draw_set_halign(fa_middle);
draw_set_font(Font3);


var topTitle = "";
switch (level) {	
	case 0: topTitle = "The Legendary\nLootsmith"; break;
	case 1: topTitle = "Settings"; break;
	case 2: topTitle = "Game Play"; break;
	case 3: topTitle = "Choose Difficulty"; break;
	case 4: topTitle = "Game is Paused"; break;
	case 5: topTitle = "Are you sure you\nwant to reset all progress?"; break;
	case 6: topTitle = "Sound"; break;
}



draw_set_alpha(1.0);
blackBorder(_x,10,topTitle);
draw_set_color(#546C96);
draw_text(_x,10,topTitle);

if (level == 0) {
	if (room == TitleScreen) layer_set_visible(layer_get_id("Title"),true);
	_y = H/2-20;
}
else {
	if (room == TitleScreen) layer_set_visible(layer_get_id("Title"),false);
	 _y = H/2 - 30;
	 if (level == 7) _y = 30;
}



for (var i = 0; i < array_length(options[level]); i++) {
	if (i == array_length(options[level])-1 && level != 6) spacing = 25;
	else if (level == 6) spacing = 40;
	if (i == array_length(options[level])-1 && level == 6) spacing = 37.5;
	
	if (level == 7) {
		spacing = 25;
		//draw_set_halign(fa_left);	
		//_x = W/2-50;
	}  else draw_set_halign(fa_middle);
	
	

	
	
	var txtLvl = options[level][i];
	blackBorder(_x,_y+spacing*i,txtLvl);	
	if (selected == i) {if (lock) col = colFlash; else col = #CCDEFF;}
		else col = c_grey;	
	
	if (level == 3 && selected == i) {
		if (selected == 0) {
			if (lock) col = colFlash; else col = c_lime;
			var rating = global.easyBeaten;
			var rating_max = 5;
			var rating_frac = frac(rating);
			rating -= rating_frac;
			for (var k = 1; k <= rating_max; k++){
				var _image_index = (k > rating);
				if (k== rating+1) {
					_image_index += (rating_frac > 0);
					_image_index += (rating_frac > 0.25);
					_image_index += (rating_frac > 0.5);
				}
				draw_sprite(star,_image_index,_x+string_length(txtLvl)+15+((k-1) * 17),_y+spacing*selected+4);
			}
		}
		else if (selected == 1) {
			var rating = global.normalBeaten;
			var rating_max = 5;
			var rating_frac = frac(rating);
			rating -= rating_frac;
			for (var k = 1; k <= rating_max; k++){
				var _image_index = (k > rating);
				if (k== rating+1) {
					_image_index += (rating_frac > 0);
					_image_index += (rating_frac > 0.25);
					_image_index += (rating_frac > 0.5);
				}
				draw_sprite(star,_image_index,_x+string_length(txtLvl)+15+((k-1) * 17),_y+spacing*selected+4);
			}
			if (lock) col = colFlash; else col = c_orange;
		}
		else if (selected == 2) {
			var rating = global.hardBeaten;
			var rating_max = 5;
			var rating_frac = frac(rating);
			rating -= rating_frac;
			for (var k = 1; k <= rating_max; k++){
				var _image_index = (k > rating);
				if (k== rating+1) {
					_image_index += (rating_frac > 0);
					_image_index += (rating_frac > 0.25);
					_image_index += (rating_frac > 0.5);
				}
				draw_sprite(star,_image_index,_x+string_length(txtLvl)+15+((k-1) * 17),_y+spacing*selected+4);
			}
			if (lock) col = colFlash; else col = c_red;
		}
	}
	draw_set_color(col);
	draw_text(_x,_y + (i * spacing), txtLvl);
	
}




draw_set_halign(fa_left);

  