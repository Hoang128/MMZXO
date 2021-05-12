/// @description Insert description here
// You can write your code in this editor
if (roomToChange != noone)
{
	if (waitTimeToChange > 0)
		waitTimeToChange -= TIME_SCALE;
	else
	{
		room_goto(roomToChange);
		roomToChange = noone;
	}
}