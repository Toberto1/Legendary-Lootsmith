
if (keyboard_check_pressed(ord("H"))) {transition(ScoreScreen); global.ratingScore = 4.75;}
if (!instance_exists(TurnOnAni)) {
	
	if ( !lock) {
		if (global.guiDown && (selected + 1) < array_length(options[level]) ) {
			selected++;
			if (!audio_is_playing(sfxMoveMenu)) audio_play_sound(sfxMoveMenu,3,false);
		}
		else if (global.guiUp && (selected - 1) > -1) {
			selected--;
			if (!audio_is_playing(sfxMoveMenu)) audio_play_sound(sfxMoveMenu,3,false);
		}
	}

	var sel = global.guiSelected;
	if (lock) sel = undefined;
	
	var tempLvl = level;

	if (sel)
		switch (level) {
	
			case 0://Main Options
				switch (selected) {
					case 0: level = 2; break;
					case 1: level = 1; break;
					case 2: level = 7; break;
					case 3: {
						scSavegame();
						game_end();
					}
				}	
			break;
			case 1: //Main Options
				switch (selected) {
					case 0: {
						level = 6; 
						instance_create_layer(W/2-sprite_get_width(sSlider)/2,H/2-35,"Instances",oMusicSlider);
						instance_create_layer(W/2-sprite_get_width(sSlider)/2,H/2+5,"Instances",oSfxSlider);
						} break;
					case 1: window_set_fullscreen( !window_get_fullscreen() )  break;
					case 2: level = 5; break;
					case 3: level = 0;
				}	
			break;
			case 2: //Main Options
				switch (selected) {
					case 0: 
						transition(RoomTutorial);
						scMusicChange(array_length(oMusic.music)-1); 
						lock = true; 
						global.difficulty = DIF.TUTORIAL;
						global.money = 100;
						global.shopOpen = false;
						global.itemHeld = -1;
						global.rating = 4.75;
						global.requirements = false;
						global.ratingBuffer = 3;
						break;
					case 1: level = 3; break;
					case 2: level = 0;
				}	
			break;
			case 3: {//Main Options
				switch (selected) {
					case 0: {
						lock = true; 
						global.difficulty = DIF.EASY;
						global.money = 60.00;
						global.shopOpen = false;
						global.itemHeld = -1;
						global.rating = 3;
						global.requirements = false;
						global.ratingBuffer = 3;
						transition(Room1);
						scMusicChange(array_length(oMusic.music)-1);
						
					} break;
					case 1: {
						lock = true; 
						global.difficulty = DIF.NORMAL;
						global.money = 30.00;
						global.shopOpen = false;
						global.itemHeld = -1;
						global.rating = 2.5;
						global.requirements = false;
						global.ratingBuffer = 0;
						transition(Room1);
						scMusicChange(array_length(oMusic.music)-1);
					} break;
					case 2:{
						lock = true; 
						global.difficulty = DIF.HARD;
						global.money = 10.00;
						global.shopOpen = false;
						global.itemHeld = -1;
						global.rating = 2;
						global.requirements = false;
						global.ratingBuffer = 3;
						transition(Room1);
						scMusicChange(array_length(oMusic.music)-1);
					} break;
					case 3: level = 2;
					
				} 
				
			}break;
			case 4: //Pause Options
				switch (selected) {
					case 0: {
						level = 6; 
						instance_create_depth(W/2-sprite_get_width(sSlider)/2,H/2-35,-999,oMusicSlider);
						instance_create_depth(W/2-sprite_get_width(sSlider)/2,H/2+5,-999,oSfxSlider);
					} break;
					case 1: {
						window_set_fullscreen( !window_get_fullscreen() )  break;
					} break;
					case 2:{
						lock = true;
						transition(TitleScreen);
						global.day++;
						global.paused = false;
					} break;
					case 3: global.paused = false;
					
				} break;
			case 5: //Confirmation
				switch (selected) {
					case 0: {
						global.easyBeaten = 0;
						global.normalBeaten = 0;
						global.hardBeaten = 0;
						global.day = 1;
						scSavegame();
						level = 1;
						script_camera_screen_shake(5,30);
					} break;
					case 1: {
						level = 1;
					}break;
					
				} break;
			case 7: //Confirmation
			switch (selected) {
				case 0: {
					
				} break;
				case 1: {
					
				}break;
				case 3: {
					level = 0;	
				} break;
					
			} break;
			case 6: //Confirmation
				switch (selected) {
					case 2: {
						if (room == TitleScreen) {
							level = 1;
							scSavegame();
						}
							else level = 4;
						
					} break;
				
				} break;
		}
	
	if (sel && tempLvl != level) {
		selected = 0;
		
	}
	
	if (sel) 
		audio_play_sound(sfxSelectMenu,3,false);
}


if (level != 6)
	if (instance_exists(oMusicSlider) || instance_exists(oSfxSlider)) {
		instance_destroy(oMusicSlider);
		instance_destroy(oSfxSlider);

}

