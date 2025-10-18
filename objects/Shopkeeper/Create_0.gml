

enum STATE {
	FREE,
	TACKLE,
	INTERACTING
}
tackle = false;
#macro CARDINAL_DIRECTION round(direction/90)
collisionMap = layer_tilemap_get_id(layer_get_id("TileCollision"));
state = STATE.FREE; 
shit = false;
hsp = 0;
vsp = 0;
inputMagnitude = 0;
moveSpeed = 1.5;
inputDirection = 0;
localFrame = 0;
z = 0;
tackleDistance = 32;
moveDistanceRemaining = tackleDistance;
tackleSpeed = 1.6;
image_speed = 0;

spriteIdle = sprite_shopkeeper_idle;
spriteMove = sprite_shopkeeper_move;
	
	


