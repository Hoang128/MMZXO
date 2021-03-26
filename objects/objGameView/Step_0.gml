/// @description Insert description here
// You can write your code in this editor
event_inherited();

with (viewStateMachine)
	fncStateHandle();
	
fncLimitHCamByLimitZone();
	
if (abs(x - movePos.x) >= camSpeed)
{
	x += sign(movePos.x - x) * camSpeed;
}

if (abs(x - movePos.x) < camSpeed)
	x = movePos.x;
	
if (abs(y - movePos.y) >= camSpeed)
{
	y += sign(movePos.y - y) * camSpeed;
}

if (abs(y - movePos.y) < camSpeed)
	y = movePos.y;