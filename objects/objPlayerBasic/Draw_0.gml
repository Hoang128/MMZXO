/// @description Insert description here
// You can write your code in this editor
draw_self();

if (instance_exists(objDebug))
{
	if (objDebug.physicVisible.player)
		draw_sprite_ext(mask_index,0,x,y,1,1,0,c_white,1);
}