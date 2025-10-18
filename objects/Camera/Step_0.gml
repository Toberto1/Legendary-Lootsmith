widthHalf = camera_get_view_width(cam) * 0.5;
heightHalf = camera_get_view_height(cam) * 0.5;

//Updating Where camera needs to be
if (instance_exists(following)) {	
	xTowards = following.x;
	yTowards = following.y;
}

//Updating actual pos
x += (xTowards - x) / 15;
y += (yTowards - y) / 15;

//Clamp Camera to border
x = clamp(x, widthHalf, room_width - widthHalf);
y = clamp(y, heightHalf, room_height - heightHalf);

//Screen Shaking 
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max (0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - widthHalf, y - heightHalf);

//Zooming 
if (!zooming) {
	width = lerp (width, 320, 0.1);
	height = lerp (height, 180, 0.1);
}	
	
	
camera_set_view_size(cam,width,height);


