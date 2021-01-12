/// @description Insert description here
// You can write your code in this editor

physic = 1;

timeScale = 1;

hspd = 0;
vspd = 0;

maxDisDetectSlopeAbove = 6;

gravAffect = 0;

function fncMoveSlopdeDownYPos()
{
	if (place_meeting(x, y + maxDisDetectSlopeAbove, objBlock))
	{
		while (!place_meeting(x, y + 1, objBlock))
		{
			y++;
		}
	}
}