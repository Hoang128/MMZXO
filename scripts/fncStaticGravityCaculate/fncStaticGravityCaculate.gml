// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticGravityCaculate(){
	if (gravAffect > 0)
	{
		if (!place_meeting(x, y + 1, objBlock))
		{
			if (vspd < global.gravMax)
				vspd += global.gravAcc;
			else
				vspd = global.gravMax;
		}
		else	vspd = 0;
	}
}