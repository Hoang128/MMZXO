/// @description Insert description here
// You can write your code in this editor
if(floor(image_index) > markImageIndex)
{
	if (markImageIndex != -1)
	{
		markImageIndex = -1;
		if (!canHitEnemy)
			canHitEnemy = true;
	}
}
	
if (spriteWeapon != noone)
{
	draw_sprite_ext(spriteWeapon, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}