/// @description Insert description here
// You can write your code in this editor
if(floor(image_index) > markImageIndex)
{
	show_debug_message("img index = " + string(image_index));
	show_debug_message("mark index = " + string(markImageIndex));
	if (markImageIndex != -1)
	{
		markImageIndex = -1;
		if (!canHitEnemy)
			canHitEnemy = true;
		show_debug_message("can hit enemy = " + string(canHitEnemy));
	}
}
	
if (spriteWeapon != noone)
{
	draw_sprite_ext(spriteWeapon, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}