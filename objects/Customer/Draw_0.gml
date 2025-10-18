if (global.paused) exit;
//Shadow
	draw_sprite_ext(sprite_shadow,1,x,y,1,1,0,c_black,0.3);

//Drawing Player 
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,y-z,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha );

if (inRange && state == CUSTOMER.WAITING) {
	draw_sprite(sprite_gearPickup_items,request,x,y-16);	
}

if (state == CUSTOMER.LEAVINGSTORE) {
	draw_sprite(sprite_emotions,emotion,x,y-16);	
}
if (state == CUSTOMER.ROB) {
	draw_sprite(sprite_emotions,3,x,y-16);	
}

if (posInLine == 0 && state == CUSTOMER.WAITING) {
	var _x = x-8;
	var _y = y-40;
	
	var c = c_red;
	draw_rectangle_color(_x,_y,_x+(14.5 * (patientTimer/patientTimerMax) ),_y+3,c,c,c,c,false);
	draw_sprite(patientBar,0,_x,_y)
	patientTimer-=0.2;
	
	if (patientTimer <= 0) {
		for (var i = posInLine; i < 5; i++) {
				var instance = ds_list_find_value(global.lineList,i);
				with (instance) {
 
					posInLine = (i-1);	
					inLine = false;
					if (state != CUSTOMER.LEAVINGSTORE && state != CUSTOMER.ROB) state = CUSTOMER.LOOKINGFORSPOT;
					ds_list_set(global.lineList,i,noone);
				}
			}
		state = CUSTOMER.LEAVINGSTORE;
		ratingChange(-0.25);
		emotion = 2;
		playSound(badDeal,4,true);
	}
}
	