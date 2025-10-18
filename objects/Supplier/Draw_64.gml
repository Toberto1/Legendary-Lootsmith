
draw_set_font(font);


if (open) { //Gui for supplying melee weapons
	
	
	draw_set_alpha(0.9);
	draw_set_color(c_blue);
	var col = #59706E
	draw_rectangle_color(0,0,320,180,col,col,col,col,false);
	
	staticY++;
	if (staticY >= 110) staticY = 0;
	if (staticY == 30) staticY = 40;
	draw_set_alpha(0.1);
	draw_set_color(c_black);
	var _width = 10;
	var _space = 20;
	for (var i=-10; i<10;i++) {
		draw_rectangle(0,staticY+i*_space,W,staticY+i*_space+_width,false);
	}	
	var list = listArr;
		switch (typeSelected) {
			case 0: list = listArr; break;
			case 1: list = listArr2; break;
			case 2: list = listArr3; break;
		}
	
		
		
		
		//List
		var _extra = 10;
		var buf = 10;
		var _space = 15;
		var _y = buf+15+_extra;
		var _x = 13;
		var b = c_black;
		var whi = c_white;
	
		draw_set_color(b);
		draw_set_alpha(0.6);
		draw_rectangle(buf,buf,W/3-buf,buf+15,false);
	

		draw_rectangle(buf,buf+15+_extra,W/3-buf,array_length(list)*15+buf+15+_extra,false);
		draw_set_valign(fa_top);

		draw_set_color(b);
		draw_rectangle(W/3,buf,W-buf,H-buf,false);
	
	
		if (--purGreenTimer > 0) draw_set_color(c_lime)
					else draw_set_color(whi);
		draw_line_width(W/3-1,H-buf*2 - 10,W-buf,H-buf*2 - 10,3);
		for (var i = 0; i < 3; i++) {
		
			
			var _sx = 28.8888888;
			draw_set_color(whi);
			draw_rectangle(buf+_sx*(typeSelected+1)-_sx, buf, buf+_sx*(typeSelected+1), buf+15, false);
			draw_sprite_ext(gearIcon,i,buf+_sx*(i+1)-_sx,buf,1,1,0,c_white,1.0);
			draw_sprite_ext(gearIcon,typeSelected,buf+_sx*(typeSelected+1)-_sx,buf,1,1,0,c_black,1.0);
		
			draw_set_alpha(1.0);
		
			if (list[selected].cost > global.money) draw_set_color(make_color_rgb(40,40,40));
			else {
				if (--purGreenTimer > 0) draw_set_color(c_lime)
					else draw_set_color(whi);
			}
			draw_rectangle(buf,15+buf+_space*(selected+1)-_space+_extra,W/3-buf,buf+_space*(selected+1)+15+_extra,false);
		
			if (list[i].cost > global.money) draw_set_color(make_color_rgb(40,40,40));
			else draw_set_color(whi);
			draw_text(_x,_y+_space*i,list[i].name);
			
			draw_set_color(b);
			draw_text(_x,_y+_space*selected,list[selected].name);
	
			if (--purGreenTimer > 0) draw_set_color(c_lime)
					else draw_set_color(whi);
			draw_text(W/3-buf+buf+5,H-buf*2 - 5,"Amount: "+string(list[selected].amount))
		
			draw_text(W/3-buf+buf+100,H-buf*2 - 5,"Item Cost: $"+string(list[selected].cost))
			draw_set_alpha(0.6);
		
		
			var sprite = -1;
			switch (typeSelected) {
				case 0: sprite = sprite_melee_weapons; break;
				case 1: sprite = sprite_ranged_weapons; break;
				case 2: sprite = sprite_potions;
			}
			var co = c_white;
			if (list[selected].cost > global.money) co = make_color_rgb(100,100,100);
			draw_sprite_ext(sprite,selected,W/3+5,buf+15,1,1,0,co,1.0);
		
	}
	
}


draw_set_alpha(1.0);