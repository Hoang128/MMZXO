/// @description Insert description here
// You can write your code in this editor

//Step handle for early dev

function fncPlayerStateIdle()
{
	if (stateInit)
	{
		hspd = 0;
		stateInit = false;
	}
	
	var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
	if (hMove != 0)
	{
		charDir = hMove;
		state = playerState.RUN;
		stateInit = true;
	}
}

function fncPlayerStateRun()
{
	if (stateInit)
	{
		stateInit = false;
	}
	
	hspd = runSpd * charDir;
	var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
	if (hMove == 0)
	{
		state = playerState.IDLE;
		stateInit = true;
	}
}

function fncPlayerStepHandle()
{
	switch(state)
	{
		case playerState.IDLE:		fncPlayerStateIdle();		break;
		case playerState.RUN:		fncPlayerStateRun();		break;
	}
}

fncPlayerStepHandle();

fncStaticGravityCaculate();


event_inherited();
