if (fadingIn) {
	alp = lerp(alp,1.0,0.09);
	if (alp >= 0.99) {
		room_goto(targetRoom);
		fadingIn = false;
	}
} else {
	alp = lerp(alp,0.0,0.09);	
	if (alp <= 0.01) instance_destroy();
}
draw_set_alpha(alp);
draw_set_color(c_black);
draw_rectangle(0,0,W,H,false);

draw_set_alpha(1.0);


