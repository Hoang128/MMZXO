/// @description Insert description here
// You can write your code in this editor

if (UIButton.enabled)
{
	var parentPos =
	{ x : 0, y : 0};
	if ((menuParent != noone) && instance_exists(menuParent))
	{
		parentPos.x = menuParent.UIBackground.xStart + menuParent.UITransPos.UICurrentDiffPosX;
		parentPos.y = menuParent.UIBackground.yStart + menuParent.UITransPos.UICurrentDiffPosY;
	}
	draw_sprite_ext(sprite_index, image_index, parentPos.x + x, parentPos.y + y, image_xscale, image_yscale, 0, c_white, 1);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (UIText.shadow)
	{
		draw_set_color(c_black);
		draw_set_font(UIText.font);
		draw_text(parentPos.x + x + UIText.pos.x + UIText.shadowDistance, parentPos.y + y + UIText.pos.y + UIText.shadowDistance, UIText.text);
	}
	draw_set_color(UIText.color);
	draw_set_font(UIText.font);
	draw_text(parentPos.x + x + UIText.pos.x, parentPos.y + y + UIText.pos.y, UIText.text);
	draw_set_color(c_white);
}