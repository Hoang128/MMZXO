/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fncStaticDestroyOutScreen(self);

motion_set(direction, moveSpd * TIME_SCALE);
accSpd *= (1.1 * TIME_SCALE);
moveSpd += (accSpd * accDir);

if (moveSpd <= 1)
{
	if (accDir == -1)
	{
		accSpd = 0.005;
		accDir = 1;
		if (direction == 20)
			direction = 340;
		else if (direction == 340)
			direction = 20;
		else if (direction == 160)
			direction = 200;
		else if (direction == 200)
			direction = 160;
	}
}
	