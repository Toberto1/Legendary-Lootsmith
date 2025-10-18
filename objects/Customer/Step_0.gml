if (global.paused) exit;
randomize();
depth = -bbox_bottom;
switch (state) {
	case CUSTOMER.LOOKINGFORSPOT: {
		
		for (var i = 0; i < 5; i++) {
			if (ds_list_find_value(global.lineList,i) == noone && !inLine) {
				ds_list_set(global.lineList,i,self);
				inLine = true;
				posInLine = i;
				break;
			}
		}
		if (inLine) state = CUSTOMER.GOINGTOSPOT;
	
	
	} break;
	case CUSTOMER.GOINGTOSPOT: {
		
		var dir = point_direction(x,y,
		FrontOfLine.x,
		FrontOfLine.y + posInLine * LINE_SPACING
		);
		//hsp = lengthdir_x(travelSpeed,dir);
		vsp = lengthdir_y(travelSpeed,dir);
		
		var dis = point_distance(x,y,
		FrontOfLine.x,
		FrontOfLine.y + posInLine * LINE_SPACING
		);
		if (dis < 3) state = CUSTOMER.WAITING;
	}break;
	case CUSTOMER.WAITING: {
		if (--maybeRobTimer <= 0 && !robber) {
			
			var chance = irandom_range(0,5);
			if (chance == 0) {
				robber = true;
				robTimer = 0;
			}
			else robber = false;
			maybeRobTimer = 300;
		}
		if (point_distance(x,y,Shopkeeper.x,Shopkeeper.y) < 16)
			inRange = true;
		else inRange = false;
		if (--robTimer <= 0 && robber && posInLine != 0) {
			for (var i = posInLine; i < 5; i++) {
				var instance = ds_list_find_value(global.lineList,i);
				with (instance) {
 
					posInLine = (i-1);	
					inLine = false;
					if (state != CUSTOMER.LEAVINGSTORE && state != CUSTOMER.ROB) state = CUSTOMER.LOOKINGFORSPOT;
					ds_list_set(global.lineList,i,noone);
				}
			}
			state = CUSTOMER.ROB;
		}
		hsp = 0;
		vsp = 0;
	} break;
	case CUSTOMER.ROB: {
		
		switch (animationTrack) {
			case 0: {
				dir = point_direction(x,y,250,50);
				hsp = lengthdir_x(travelSpeed,dir);
				vsp = lengthdir_y(travelSpeed,dir);
				var dis = point_distance(x,y,250,50);
				if (dis <= 5) { 
					if (route == 1) animationTrack++;
						else animationTrack = 4;
				}
			}break;
			case 1: {
				vsp = lengthdir_y(travelSpeed,270);
				hsp = 0;
				if (y >= 140) animationTrack++;
			}break;
			case 2: {
				hsp = lengthdir_x(travelSpeed,180);
				vsp  = 0;
				if (x <= 160) animationTrack++;
			}break;
			case 3: {
			vsp = lengthdir_y(travelSpeed,270);
			hsp = 0;
			}break;
			case 4: {
				dir = point_direction(x,y,250,80);
				var dis = point_distance(x,y,250,80);
				hsp = lengthdir_x(travelSpeed,dir);
				vsp = lengthdir_y(travelSpeed,dir);		
				if (dis <= 2) 
					animationTrack++;
			} break;
			case 5: {
				dir = point_direction(x,y,55,84);
				var dis = point_distance(x,y,55,84);
				hsp = lengthdir_x(travelSpeed,dir);
				vsp = lengthdir_y(travelSpeed,dir);		
				if (dis <= 2) 
					animationTrack++;
			} break;
			case 6: {
				dir = point_direction(x,y,56,125);
				var dis = point_distance(x,y,56,125);
				hsp = lengthdir_x(travelSpeed,dir);
				vsp = lengthdir_y(travelSpeed,dir);		
				if (dis <= 2) 
					animationTrack++;
			} break;
			case 7: {
				dir = point_direction(x,y,156,125);
				var dis = point_distance(x,y,156,125);
				hsp = lengthdir_x(travelSpeed,dir);
				vsp = lengthdir_y(travelSpeed,dir);		
				if (dis <= 2) 
					animationTrack = 3;
			} break;
			
	}
		inLine = false;
		if (y >= 190 && animationTrack > 2) {
			moneyAddSub(floor(global.money/-2));
			instance_destroy();
		}
		if (place_meeting(x,y,Shopkeeper) && Shopkeeper.state == STATE.TACKLE) {
			
			state = CUSTOMER.BEINGTACKLED;
			script_camera_screen_shake(3,5);
			playSound(sfxTackleHIt,3,true);
		}
		
	}break;
	
	case CUSTOMER.BEINGTACKLED: {
		
		image_angle = round(Shopkeeper.direction/90)*90 - 90;
		depth = Shopkeeper.depth+5;
		hsp = 0;
		vsp = 0;
		z = 0;
		
		x = Shopkeeper.x;
		y = Shopkeeper.y-4;
		
		if (Shopkeeper.moveDistanceRemaining <= 0) {
			instance_destroy();
			audio_play_sound(sfxCustomerDeath,5,false);
			
			if (room == RoomTutorial && Tutorial.step == 12 && !Tutorial.checkVisable) 
				tutorialCheck(W/2,H/2);
		}
		
	}break;
	case CUSTOMER.LEAVINGSTORE: {
		global.startTimer = true;
		if (y > 170) animationTrack = 3;
		switch (animationTrack) {
			case 0: {
				hsp = lengthdir_x(travelSpeed,180);
				vsp = 0;
				if (x <= 130) animationTrack++;
			}break;
			case 1: {
				hsp = 0;
				vsp = lengthdir_y(travelSpeed,270);	
				if (y >= 150) animationTrack++;
			} break;
			case 2: {
				var _dir = point_direction(x,y,159,149);
				if (point_distance(x,y,159,149) >= 3) {
					vsp = lengthdir_y(travelSpeed,_dir);	
					hsp = lengthdir_x(travelSpeed,_dir);
				} else animationTrack++;
			}break;
			case 3: {
				hsp = 0;
				vsp = lengthdir_y(travelSpeed,270);	
				if (y > 300) instance_destroy();
			}break;
		}
	}
}	
x += hsp;
y += vsp;
if (hsp != 0) image_xscale = sign(hsp);

if (hsp != 0 || vsp != 0) {
	
	if (z <= 0) zsp = 1;
	
	
	
}
if (z > 0) {
	zsp -= grv;
}
z += zsp;
z = clamp(z,0,10);
if (!global.shopOpen || global.bankrupt || global.time <= 0) state = CUSTOMER.LEAVINGSTORE;
