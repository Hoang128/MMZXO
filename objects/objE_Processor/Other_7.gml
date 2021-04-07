/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprProcessorChangeDir)
{
	sprite_index = sprProcessorFly;
	image_index = 0;
	image_xscale *= - 1;
	state = processorState.FLY;
	hspd = moveSpd * image_xscale;
}