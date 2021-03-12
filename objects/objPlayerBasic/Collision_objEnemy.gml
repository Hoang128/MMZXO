/// @description Insert description here
// You can write your code in this editor

if (inviTime == 0)
{
	hp -= other.damage;
	
	inviTime = inviAfterStunMax;
	with (playerStateMachine)
		fncStateChange(objPlayerStateStunNor);
}