/// @description 

fncStaticDestroyOutScreen(self);

if (!inited)
{
	lastMaxVspd = vspd;
	inited = true;
}

if (place_meeting(x, y, objBlock))
	instance_destroy();

if (physic.onGround)
{
	if (lastMaxVspd < -1)
	{
		vspd = lastMaxVspd * 0.5;
		lastMaxVspd = vspd;
		physic.onGround = false;
	}
	else
	{
		vspd = 0;
		instance_destroy();
	}
}

if (cycleEff > cycleEffMax)
{
	cycleEff = 0;
}
else
{
	if (cycleEff < cycleEffMax / 2)	image_alpha = 0.8;
	else image_alpha = 0;
	cycleEff += TIME_SCALE;
}

event_inherited();