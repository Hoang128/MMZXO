/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (UIButton.enabled)
{
	if (UIButtonImg != noone)
	{
		var parentPos =
		{ x : 0, y : 0};
		if ((menuParent != noone) && instance_exists(menuParent))
		{
			parentPos.x = menuParent.UIBackground.xStart + menuParent.UITransPos.UICurrentDiffPosX;
			parentPos.y = menuParent.UIBackground.yStart + menuParent.UITransPos.UICurrentDiffPosY;
		}
		draw_sprite_ext(UIButtonImg, 0, parentPos.x + x, parentPos.y + y, image_xscale, image_yscale, 0, c_white, 1);
	}
}