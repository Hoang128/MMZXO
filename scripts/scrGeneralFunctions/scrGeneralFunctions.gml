// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function fncStaticDestroyOutScreen(ins)
{
	if (!collision_rectangle(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, ins, false, false))
		instance_destroy(ins);
}