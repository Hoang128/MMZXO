/// @description Insert description here
// You can write your code in this editor

if (stageBossSprite != noone)
{
	draw_sprite_ext(sprMShotBoss, stageBossId, x + 8, y + 5, 4, 4, 0, c_white, 1);
}
draw_sprite(sprUIStageIcon, 0, x, y);
if (cursorOn)
{
	draw_sprite(sprStageSelector, 0, x - 1, y - 1);
}