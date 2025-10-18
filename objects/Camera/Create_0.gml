//Set up
cam = view_camera[0];
if (instance_exists(Shopkeeper))
	following = Shopkeeper;
else following = MainMenu;


zooming = false;
width = camera_get_view_width(cam);
height = camera_get_view_height(cam)

widthHalf = camera_get_view_width(cam) * 0.5;
heightHalf = camera_get_view_height(cam) * 0.5;

xTowards = xstart;
yTowards = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;