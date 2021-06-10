/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 3;
bullet = 1;
destroyWhenHit = false;
direction = 30;
moveSpd = 1.5;
imgSpd = 1;
createDestroyEff = false;

waitToBounce = 5;
waitTime = 0;

waitToCreateTrail = 0;
waitToCreateMax = 15;

existTime = 240;

canBounce = true;

inited = false;

function fncChangeImgDir()
{
	switch (direction)
	{
		case 20:
		{
			image_xscale = 1;
			image_yscale = 1;
			image_angle = 0;
		}	break;
		case 70:
		{
			image_xscale = -1;
			image_yscale = 1;
			image_angle = -90;
		}	break;
		case 110:
		{
			image_xscale = 1;
			image_yscale = 1;
			image_angle = 90;
		}	break;
		case 160:
		{
			image_xscale = -1;
			image_yscale = 1;
			image_angle = 0;
		}	break;
		case 200:
		{
			image_xscale = -1;
			image_yscale = -1;
			image_angle = 0;
		}	break;
		case 250:
		{
			image_xscale = -1;
			image_yscale = 1;
			image_angle = 90;
		}	break;
		case 290:
		{
			image_xscale = -1;
			image_yscale = -1;
			image_angle = 90;
		}	break;
		case 340:
		{
			image_xscale = 1;
			image_yscale = -1;
			image_angle = 0;
		}	break;
	}
}