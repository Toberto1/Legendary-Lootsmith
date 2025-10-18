
if (!instance_exists(MainMenu)) instance_destroy();
if (instance_exists(MainMenu) && MainMenu.selected == 0)
	selected = true;	
else selected = false;


value = clamp(value,0,1);

if (selected) {
	global.music_volume = value;
	audio_group_set_gain(Music,global.music_volume,0);
	
	if (global.guiLeft) {
		value-=0.1;
		if (!audio_is_playing(sfxMoveMenu))audio_play_sound(sfxMoveMenu,3,false);
	}
	if (global.guiRight) {
		value+=0.1;
		if (!audio_is_playing(sfxMoveMenu))audio_play_sound(sfxMoveMenu,3,false);
	}
	
}