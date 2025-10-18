if (state != CUSTOMER.LEAVINGSTORE) {
	instance_create_depth(x,y,depth-10,Dust);
	script_camera_screen_shake(3,3);
}
