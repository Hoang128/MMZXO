/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x += image_xscale * hMoveSpd * TIME_SCALE;

if (!collision_rectangle(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, self, false, false))
{
	if (instance_exists(pool))
	{
		with (pool)
		{
			instance_destroy();
			createDestroyEff = false;
		}
	}
}