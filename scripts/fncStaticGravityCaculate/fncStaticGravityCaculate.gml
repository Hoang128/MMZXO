// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticGravityCaculate(){
	if (gravAffect > 0)
	{
		if (grav < global.gravMax)
			grav += global.gravAcc;
		else
			grav = global.gravAcc;
		vspd += grav;
	}
}