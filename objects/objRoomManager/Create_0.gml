/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

roomToChange = noone;
waitTimeToChange = 60;

function fncChangeRoomTo(newRoom)
{
	roomToChange = newRoom;
	
	var objSceneFade = instance_create_depth(x, y, depth, objSceneFadeInColor);
	objSceneFade.fadeSpd = 0.025;
	objSceneFade.colorVal = c_black;
}