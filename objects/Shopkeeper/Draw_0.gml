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
		
	if (global.itemHeld != -1) draw_sprite(sprite_gearPickup_items,global.itemHeld,x,y-16);