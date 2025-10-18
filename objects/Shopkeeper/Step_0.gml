if (global.paused) exit;


function script_player_animation() {
	var _totalframes = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (CARDINAL_DIRECTION * _totalframes);
	localFrame += (sprite_get_speed(sprite_index) / 60);
	if (localFrame >= _totalframes) {	
		animationend = true;
		localFrame = 0;	
	} 
	else animationend = false;
}
function script_player_tile_collision(){
	var tileSize = 8;
	var colliding = false;
	//Horizonal Tile Collision
	if (tilemap_get_at_pixel(collisionMap, x + hsp, y)) {
		x -= x % tileSize;	
		if (hsp > 0)
			x += tileSize - 1;
		hsp = 0;
		colliding = true;
	} x += hsp;
	//Vertical Tile Collision
	if (tilemap_get_at_pixel(collisionMap, x, y + vsp)) {
		y -= y % tileSize;	
		if (vsp > 0)
			y += tileSize - 1;
		vsp = 0;
		colliding = true;
	} y += vsp;	
	return colliding;
}
switch (state) {
	
	case STATE.FREE: {
		keyRight = keyboard_check(ord("D")) || keyboard_check (vk_right);
		keyLeft = keyboard_check(ord("A")) || keyboard_check (vk_left);
		keyDown = keyboard_check(ord("S")) || keyboard_check (vk_down);
		keyUp = keyboard_check(ord("W")) || keyboard_check (vk_up);
	
		inputDirection = point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp); //Checks the direction of the movement
		inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0); //Checks if a movement key is being pressed
	
		hsp = lengthdir_x(inputMagnitude * moveSpeed, inputDirection);
		vsp = lengthdir_y(inputMagnitude * moveSpeed, inputDirection);
		z = 0;
		var _oldsprite = sprite_index;
	
		if (inputMagnitude != 0) {	
			direction = inputDirection;	
			sprite_index =	spriteMove;
		} else sprite_index = spriteIdle;
	
		if (_oldsprite != sprite_index) localFrame = 0;
	
		script_player_animation();
		
		if (keyboard_check_pressed(vk_enter)) {
			var instance =  instance_position(x+lengthdir_x(5,direction),y+lengthdir_y(5,direction),Customer);
			if (instance && global.itemHeld != -1 && instance.state == CUSTOMER.WAITING) {
				for (var i = instance.posInLine; i < 5; i++) {
					var instance2 = ds_list_find_value(global.lineList,i);
					with (instance2) {
 
						posInLine = (i-1);	
						inLine = false;
						if (state != CUSTOMER.LEAVINGSTORE && state != CUSTOMER.ROB) state = CUSTOMER.LOOKINGFORSPOT;
						ds_list_set(global.lineList,i,noone);
					}
				}
				if (room == RoomTutorial && Tutorial.step == 11 && !Tutorial.checkVisable) 
					tutorialCheck(W/2,H/2);
				with (instance) {
					
					state = CUSTOMER.LEAVINGSTORE;
					var itemInRange = false;
					
					if (global.itemHeld < 3 && request < 3 || 
					global.itemHeld < 6 && global.itemHeld > 2 && request < 6 && request > 2 ||
					global.itemHeld < 9 && global.itemHeld > 5 && request < 9 && request > 5) 
						itemInRange = true;
					
					
					if (global.itemHeld == request) {
						emotion = 0;
						playSound(goodDeal,4,true);
					}
					else if (itemInRange) {
						emotion = 1;
						playSound(badDeal,4,true);
					}
					else {
						emotion = 2;	
						playSound(badDeal,4,true);
					}
				
				}
				switch (instance.emotion) {
					case 0: {var multiplyer = 2; ratingChange(0.25);}break;
					case 1: {var multiplyer = -1; ratingChange(0);}break;
					case 2: {var multiplyer = -2; ratingChange(-0.25);}break;
				} 		
				var multiplyerRating = 0;
				//switch (floor(global.rating)) {
				//	case 0: multiplyerRating = -0.5; break;
				//	case 1: multiplyerRating = -0.2; break;
				//	case 2: multiplyerRating = 0; break;
				//	case 3: multiplyerRating = 0; break;
				//	case 4: multiplyerRating = 0.5; break;
				//	case 5: multiplyerRating = +2.0; break;
				//}
				
			
				
				var mon = 0;
				switch (global.itemHeld) {
					case 0:	mon += Supplier.listArr[0].cost+multiplyer; break;
					case 1: mon += Supplier.listArr[1].cost+multiplyer; break;
					case 2: mon += Supplier.listArr[2].cost+multiplyer; break;
					case 3:	mon += Supplier.listArr2[0].cost+multiplyer; break;
					case 4: mon += Supplier.listArr2[1].cost+multiplyer;break;
					case 5: mon += Supplier.listArr2[2].cost+multiplyer; break;
					case 6: mon += Supplier.listArr3[0].cost+multiplyer; break;
					case 7: mon += Supplier.listArr3[1].cost+multiplyer; break;
					case 8: mon += Supplier.listArr3[2].cost+multiplyer; break;
				}
				moneyAddSub(mon);
				switch (global.itemHeld) {
					case 0:	Supplier.listArr[0].amount--; break;
					case 1: Supplier.listArr[1].amount--; break;
					case 2: Supplier.listArr[2].amount--; break;
					case 3:	Supplier.listArr2[0].amount--; break;
					case 4: Supplier.listArr2[1].amount--; break;
					case 5: Supplier.listArr2[2].amount--; break;
					case 6:	Supplier.listArr3[0].amount--; break;
					case 7: Supplier.listArr3[1].amount--; break;
					case 8: Supplier.listArr3[2].amount--; break;
				}
				global.itemHeld = -1;
				
			}
		}
		
		if (keyboard_check_pressed(vk_space)) {
			state = STATE.TACKLE;
			moveDistanceRemaining = tackleDistance;	
		}
		
		
	} break;
	case STATE.TACKLE: {
		script_player_animation();

		moveDistanceRemaining = max(0,moveDistanceRemaining - tackleSpeed);
		
		//Update Sprite
		sprite_index = sprite_shopkeeper_tackle;
		var _totalframes = sprite_get_number(sprite_index) / 4;
		image_index = (CARDINAL_DIRECTION * _totalframes) + min(((1 - (moveDistanceRemaining/tackleDistance))* (_totalframes)) ,_totalframes -1);
		
		//Change State
		if (moveDistanceRemaining <= 0 ) {
			
			
			if (!shit) { script_camera_screen_shake(3,1); shit = true; playSound(sfxTackleLand,3,true);}
			localFrame = _totalframes;
			hsp = lerp(hsp,0,0.08);
			vsp = lerp(vsp,0,0.08);	
			if (abs(hsp) <= 0.1&& abs(vsp) <= 0.1) {
				state = STATE.FREE;
				shit = false;
				tackle = false;
			}
		} else {
			//Movement
			hsp = lengthdir_x(tackleSpeed,direction);
			vsp = lengthdir_y(tackleSpeed,direction);
		}		
	}break;
	case STATE.INTERACTING: {
		sprite_index = spriteIdle;
		hsp = lerp (hsp,0,0.4);	
		vsp = lerp (vsp,0,0.4);	
	}
	
	
}
if (global.itemHeld != -1) {
			spriteIdle = sprite_shopkeeper_idle_hold;
			spriteMove = sprite_shopkeeper_move_hold;	
		} else {
			spriteIdle = sprite_shopkeeper_idle;	
			spriteMove = sprite_shopkeeper_move;	
		}
script_player_tile_collision();
depth = -bbox_bottom;