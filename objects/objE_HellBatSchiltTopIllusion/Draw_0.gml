/// @description Insert description here
// You can write your code in this editor
if (  ((inviLim.min < inviLim.max) && ((inviTime >= inviLim.min) && (inviTime <= inviLim.max)))
   || ((inviLim.min > inviLim.max) && ((inviTime <= inviLim.min) || (inviTime >= inviLim.max))))
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, alpha);
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0);
}
