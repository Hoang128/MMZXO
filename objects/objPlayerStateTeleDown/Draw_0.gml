/// @description Insert description here
// You can write your code in this editor

var spriteIndex = core.sprite_index;
var imageIndex = core.image_index;

draw_sprite_ext(spriteIndex, imageIndex, x, y - teleHeight, xScale, yScale, 0, c_white, 1);
if (teleTime > 0)
{
	gpu_set_fog(true,c_white,0,0);
}
draw_sprite_ext(spriteIndex, imageIndex, x, y - teleHeight, xScale, yScale, 0, c_white, alphaBlend);
if (teleTime > 0)
{
	gpu_set_fog(false,c_white,0,0);
}