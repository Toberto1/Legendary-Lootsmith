audio_group_load(SoundEffects);
audio_group_load(Music);


music = [musicShopLoop,musicMenuLoop,musicSoft];
sfx = [sfxMoveMenu,sfxSelectMenu,sfxCustomerDeath];

music_playing = music[1];

if (audio_group_is_loaded(Music)) {
	control = true;
	audio_play_sound(music_playing,1000,true);
}	else control = false;

music_target = 0;
sfx_loaded = false;
music_loaded = false;

change_music = false;

audio_group_set_gain(Music,global.music_volume,0);