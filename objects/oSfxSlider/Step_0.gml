
if (!instance_exists(MainMenu)) instance_destroy();
if (instance_exists(MainMenu) && MainMenu.selected == 1)
	selected = true;	
else selected = false;


value = clamp(value,0,1);

if (selected) {
	global.sfx_volume = value;
	if (global.guiLeft) {
		value-=0.1;
		if (!audio_is_playing(sfxMoveMenu))audio_play_sound(sfxMoveMenu,3,false);
	}
	if (global.guiRight) {
		value+=0.1;
		if (!audio_is_playing(sfxMoveMenu))audio_play_sound(sfxMoveMenu,3,false);
	}
	
	audio_group_set_gain(SoundEffects,global.sfx_volume,0);
}