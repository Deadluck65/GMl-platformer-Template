/// @description Add platformer mechanics

//Get Keyboard inputes
//keyboard_check(key) will return 1 if pressed or 0 if not pressed
key_right = keyboard_check(vk_right); // ord('D') for the letter D
key_left = keyboard_check(vk_left);	   // ord('A') for A
key_jump = keyboard_check(vk_up);

//work out where to move horizontally
// will equal 0, -4, or 4 after the next expression
hsp = (key_right - key_left) * hsp_walk; 

//Work out where to move vertically
vsp = vsp + grv;

//Work out if we should jump
if ( place_meeting( x, y + 1, oWall) ) and (key_jump)
{
	if (keyboard_check(vk_shift))
	{
		vsp = vsp_jump - 2;
	}
	else{
		vsp = vsp_jump
	}
}

//check for horizontal collisions
var onepixel = sign(hsp) // sign() returns -1, 0, or 1
if (place_meeting(x + hsp, y, oWall) ) 
{
	// move as close as we can 
	//move 1px toward the Wall until we're 1px away
	while ( !place_meeting(x + onepixel, y, oWall) )
	{
		x = x + onepixel;
	}
	hsp = 0;  // once we're 1 pixel away, stop moving
}
// update x
x = x + hsp;

// check for vertical collisions
var onepixel = sign(vsp);
if (place_meeting(x, y +vsp, oWall) )
{
	//move as close as we can, then stop
	while (!place_meeting(x, y + onepixel, oWall) )
	{
		y = y + onepixel;
	}
	vsp = 0;
}
//update y
y = y + vsp;