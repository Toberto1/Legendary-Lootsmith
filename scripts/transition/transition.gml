function transition(_room){
	with (instance_create_depth(0,0,-999,TRANSITION)) {
		targetRoom = _room;
	}
}