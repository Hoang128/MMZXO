/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_text(x, y + 16, "have floor ahead = " + string(fncIsBlockFloorAhead(image_xscale, maxDisDetectSlopeAbove, image_yscale)));
if (instance_exists(objPlayerBasic))
{
	draw_text(x, y + 24, "y distance = " + string(self.y - objPlayerBasic.y));
}