function playSound(sound,pri,bol){
	
	if (argument_count == 3)
		audio_play_sound(sound,pri,false);
	else {
		if (!audio_is_playing(sound)) audio_play_sound(sound,pri,false);
	}
}