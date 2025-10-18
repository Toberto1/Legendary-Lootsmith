function blackBorder(_x,_y,txt) {
	draw_set_color(c_black);
	draw_text(_x+1,_y, txt);
	draw_text(_x-1,_y, txt);
	draw_text(_x,_y-1, txt);
	draw_text(_x,_y+1, txt);
	draw_text(_x,_y+2, txt);
	draw_text(_x,_y+3, txt);
	draw_text(_x+1,_y+3, txt);
	draw_text(_x-1,_y+3, txt);
	draw_text(_x+1,_y+2, txt);
	draw_text(_x-1,_y+2, txt);
}