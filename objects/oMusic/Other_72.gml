if (audio_group_is_loaded(Music)) {
	audio_group_set_gain(Music,0,0);
	audio_play_sound(music_playing,1000,true);
	
	audio_group_set_gain(Music,global.music_volume,3000);
	music_loaded = true;
	control = true;
}
if (audio_group_is_loaded(SoundEffects)) {
	sfx_loaded = true;
	audio_group_set_gain(SoundEffects,global.sfx_volume,0);
}
