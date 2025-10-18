function script_camera_screen_shake(_magnitude, _length){
	with (Camera) 
		if (_magnitude > shakeRemain) {
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _length;		
		}
}