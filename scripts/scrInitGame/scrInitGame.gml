// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticInitGame(){
	fncStaticInitWorldParams();
	fncStaticInitKeyboardParams();
}

function fncStaticInitWorldParams()
{
	//Time
	global.timeScale = 1;
	global.timeScaleSlow = 0.2;
	
	//Physics
	global.gravAcc = 0.4;
	global.gravMax = 4;
	global.gravScale = 1;
	global.waterGravScale = 0.2;
}

function fncStaticInitKeyboardParams()
{
	global.keyRight = vk_right;
	global.keyLeft = vk_left;
	global.keyUp = vk_up;
	global.keyDown = vk_down;
	
	global.keyDash = ord("Z");
	global.keyJump = ord("X");
	global.keyAtk1 = ord("C");
	global.keyAtk2 = ord("V");
	global.keyItem1 = ord("A");
	global.keyItem2 = ord("S");
	global.keyGiga = vk_space;
}

function fncStaticInitPlayerStates()
{
	enum playerState
	{
		IDLE,
		RUN,
		JUMP,
		DASH,
		WALL_KICK,
		WALL_SLIDE,
		WIRE_PLUG,
		CLIMB,
		FREEZE_ATTACK
	}
	
	enum PlayerAtkState
	{
		ATTACK_0,
		ATTACK_1,
		ATTACK_2,
		ATTACK_3,
		CAN_NOT_CANCEL
	}
}