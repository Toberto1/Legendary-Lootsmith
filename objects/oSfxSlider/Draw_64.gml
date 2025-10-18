draw_self();
var heldFrame = 0;
if (selected) {
	heldFrame = 1;	
} else heldFrame = 0;
draw_sprite_part(sprite_index,1,0,0,sprite_width*global.sfx_volume, sprite_height,x,y-sprite_get_yoffset(sprite_index));
draw_sprite(sSliderButton,heldFrame,x+sprite_width*global.sfx_volume,y);




