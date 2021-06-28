/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

lastStage = noone;

roomInfo =
{
	roomId : noone
};

roomToChange = noone;
waitTimeToChange = 60;

function fncChangeRoomTo(newRoom, haveEffect)
{
	if (haveEffect)
	{
		roomToChange = newRoom;
	
		var objSceneFade = instance_create_depth(x, y, depth, objSceneFadeInColor);
		objSceneFade.fadeSpd = 0.025;
		objSceneFade.colorVal = c_black;
	}
	else
	{
		room_goto(newRoom);
	}
}