//Gui Controls
global.guiUp = keyboard_check_pressed (vk_up) || keyboard_check_pressed (ord("W"));
global.guiDown = keyboard_check_pressed (vk_down) || keyboard_check_pressed (ord("S"));;

global.guiRight = keyboard_check_pressed (vk_right) || keyboard_check_pressed (ord("D"));;
global.guiLeft = keyboard_check_pressed (vk_left) || keyboard_check_pressed (ord("A"));;

global.guiSelected = keyboard_check_pressed (vk_enter) || keyboard_check_pressed (vk_space);

if (gameStartBuf >=0) gameStartBuf--;

if ( room != TitleScreen && room != ScoreScreen) {
	if (keyboard_check_pressed(vk_escape)) {
		global.paused = !global.paused;
	}
	if (global.paused) {
		if (!instance_exists(MainMenu))
			with (instance_create_depth(0,0,-995,MainMenu)) {
				level = 4;	
			}
	} else {
		if (instance_exists(MainMenu))
			with (MainMenu) instance_destroy()
	}
}

if (room != TitleScreen && global.shopOpen && !global.paused && global.startTimer) 
	global.time--;
with (Supplier) {
	for (var i = 0; i < 9; i++) {
	
		if (i < 3)
			global.gearAmounts[i] = Supplier.listArr[i].amount; 
		else if (i < 6)
			global.gearAmounts[i] = Supplier.listArr2[i-3].amount; 
		else if (i < 9)
			global.gearAmounts[i] = Supplier.listArr3[i-6].amount; 
	
	}
}
//if (global.time <= 0)
//	global.requirements = true;

with (oMusic) {
	if (room == TitleScreen || room == ScoreScreen) {
		audio_sound_pitch(music_playing,1.0)
	}
	else {
		switch (ceil((global.time/40)/60)) {
			case 5: audio_sound_pitch(music_playing,1.0)	 break;
			case 4: audio_sound_pitch(music_playing,1.05) break;
			case 3: audio_sound_pitch(music_playing,1.15) break;
			case 2: audio_sound_pitch(music_playing,1.3)	 break;
			case 1: audio_sound_pitch(music_playing,1.5)	 break;
		
		}
		if (global.time <= 0)
			 audio_sound_pitch(music_playing,1.0)
	}
	
}

global.money = clamp(global.money,0,99999);
global.rating = clamp(global.rating,0,6);

