global.music_volume = clamp(global.music_volume,0,1);
if (control) {
	if (change_music == true) {
		change_music = false;
		control = false;
		audio_play_sound(music[music_target],1000,true);
		audio_sound_gain(music[music_target],0,0);
		audio_sound_gain(music[music_target],global.music_volume,2000);
		audio_sound_gain(music_playing,0,1000);
	}
}
else {
	if (audio_sound_get_gain(music_playing) == 0) {
	
		audio_stop_sound(music_playing);
		music_playing = music[music_target];
		audio_group_set_gain(Music,global.music_volume,0);
		control = true;
	}
}