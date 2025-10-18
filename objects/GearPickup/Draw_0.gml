draw_self();
if (inRange && !open) {
	draw_sprite(sprite_computer_toolTip,0,x,y-16);	
}

if (open) {
	if (global.itemHeld != -1) global.itemHeld = -1;
	var h = 16;
	if (global.gearAmounts[selected] == 0)
		draw_sprite(sprite_gearPickup_items,9,x,y-h);
	else {
		draw_sprite(sprite_gearPickup_items,selected,x,y-h);
		var amo = 0;
		draw_set_font(Font2);
		switch (selected) {
			case 0:	amo = Supplier.listArr[0].amount; break;
			case 1: amo =Supplier.listArr[1].amount; break;
			case 2: amo=Supplier.listArr[2].amount; break;
			case 3:	amo=Supplier.listArr2[0].amount; break;
			case 4: amo= Supplier.listArr2[1].amount; break;
			case 5: amo=Supplier.listArr2[2].amount; break;
			case 6:	amo=Supplier.listArr3[0].amount; break;
			case 7: amo= Supplier.listArr3[1].amount; break;
			case 8: amo=Supplier.listArr3[2].amount; break;
		}
		draw_text(x-1,y-h-25,string(amo));
	}
	
	draw_set_color(c_white);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	var buf = 13;
	var h = 24;
	draw_text(x-buf+2,y-h,"<");
	draw_text(x+buf,y-h,">");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}


