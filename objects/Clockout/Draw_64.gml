if (open) {
	draw_set_alpha(1.0);
	draw_set_font(Font2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_stretched(box,0,W/2-45,H/2-20,90,40);
	draw_set_color(c_white);
	
	if (global.bankrupt) {
		draw_text(W/2,H/2,"No more customers want\nanymore business because\nof the store rating.\nPlease try again another day.");
	} else {
		if (global.time <= 0) {
			draw_text(W/2,H/2,"It is closing time.\nWalk through the door\nto save your score!");
			global.shopOpen = false; 
			global.requirements = true;
			
		}else 
			draw_text(W/2,H/2,""+string( ceil(((global.time/40)/60))  )+" more hour(s)\nto go before closing.");
	}
	
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
}