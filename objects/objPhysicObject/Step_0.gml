/// @description Insert description here
// You can write your code in this editor

if (physic == 1)
{
	//Horizontal handle
	if(place_meeting(x + hspd, y, objBlock))
	{
		while(!place_meeting(x + sign(hspd), y, objBlock))
		{
			x += sign(hspd);
		}
		hspd = 0;
	}
	
	//Vertical handle
	if(place_meeting(x, y + vspd, objBlock))
	{
		while(!place_meeting(x, y + sign(vspd), objBlock))
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
}

x += hspd * TIME_SCALE;
y += vspd * TIME_SCALE;