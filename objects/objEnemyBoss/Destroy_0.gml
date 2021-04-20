/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with (bossManager)
{
	fncChangeToEndCutsceneState();
	x = (other.bbox_left + other.bbox_right) / 2;
	y = (other.bbox_top + other.bbox_bottom) / 2;
}