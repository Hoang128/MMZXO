// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticInitGame(){
	fncStaticInitDevParams();
	fncStaticInitWorldParams();
	fncStaticInitInputParams();
	fncStaticInitMacros();
}

function fncStaticInitDevParams()
{
	global.debug = true;
}

function fncStaticInitMacros()
{
	//Macros
	#macro TIME_SCALE global.timeScale * timeScale
	#macro VIEW_W 340
	#macro VIEW_H 192
	#macro VPORT_W 1920
	#macro VPORT_H 1080
}

function fncStaticInitWorldParams()
{
	//Time
	global.timeScale = 1;
	global.timeScaleSlow = 0.2;
	
	//Physics
	global.gravAcc = 0.2;
	global.gravMax = 4;
	global.gravScale = 1;
	global.waterGravScale = 0.2;
	
	//World
	global.roomState = RoomState.MENU;
	global.playerStartPosition =
	{
		x : 0,
		y : 0
	};
}

function fncStaticInitInputParams()
{
	global.input = 
	{
		keyboard : true,
		gamepad : false
	};
	fncStaticInitKeyboardParams();
}

function fncStaticInitKeyboardParams()
{
	global.keyRight			= vk_right;
	global.keyLeft			= vk_left;
	global.keyUp			= vk_up;
	global.keyDown			= vk_down;
	
	global.keyDash			= ord("Z");
	global.keyJump			= ord("X");
	global.keyAtk1			= ord("C");
	global.keyAtk2			= ord("V");
	global.keyChangeL		= ord("A");
	global.keyChangeR		= ord("S");
	global.keyMoveL			= ord("D");
	global.keyMoveR			= ord("F");
	
	global.keyUIRight		= vk_right;
	global.keyUILeft		= vk_left;
	global.keyUIUp			= vk_up;
	global.keyUIDown		= vk_down;
	global.keyUIConfirm		= vk_enter;
	global.keyUIBack		= vk_backspace;
	global.keyUIConfirmSub	= ord("X");
	global.keyUIBackSub		= ord("Z");
	
}

function fncStaticInitStates()
{
	enum RoomState
	{
		MENU,
		STAGE
	}
	
	enum KeyMap
	{
		LEFT,
		RIGHT,
		UP,
		DOWN,
		DASH,
		JUMP,
		ATTACK1,
		ATTACK2,
		CHANGE_L,
		CHANGE_R,
		MOVE_L,
		MOVE_R
	}
	
	enum KeyMapUI
	{
		LEFT,
		RIGHT,
		UP,
		DOWN,
		CONFIRM,
		BACK,
		CONFIRM_SUB,
		BACK_SUB
	}
	
	enum KeyAction
	{
		HELD,
		PRESSED,
		RELEASED
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

/// @function					fncStaticHandleButton(keyMap, keyAction);
/// @param {enum}  keyMap		The key mapped to control
/// @param {enum}  keyAction	Action player perform to the key
/// @description				use to control buttons in different platforms & devices.

function fncStaticHandleButton(keyMap, keyAction)
{
	switch (keyAction)
	{
		case KeyAction.HELD:
		{
			if (fncStaticHandleButtonHeld(keyMap))
				return true;
			else	return false;
		}	break;
		
		case KeyAction.PRESSED:
		{
			if (fncStaticHandleButtonPressed(keyMap))
				return true;
			else	return false;
		}	break;
		
		case KeyAction.RELEASED:
		{
			if (fncStaticHandleButtonReleased(keyMap))
				return true;
			else	return false;
		}	break;
	}
}

/// @function					fncStaticHandleButtonHeld(keyMap);
/// @param {enum}  keyMap		The key mapped to control
/// @description				use to control buttons held in different platforms & devices.
function fncStaticHandleButtonHeld(keyMap)
{
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check(keyInput))
			return true;
	}
	
	return false;
}

/// @function					fncStaticHandleButtonPressed(keyMap);
/// @param {enum}  keyMap		The key mapped to control
/// @description				use to control buttons pressed in different platforms & devices.
function fncStaticHandleButtonPressed(keyMap)
{
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check_pressed(keyInput))
			return true;
	}
	
	return false;
}

/// @function					fncStaticHandleButtonReleased(keyMap);
/// @param {enum}  keyMap		The key mapped to control
/// @description				use to control buttons released in different platforms & devices.

function fncStaticHandleButtonReleased(keyMap)
{
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check_released(keyInput))
			return true;
	}
	
	return false;
}

function fncStaticGetKeyBoardMap(keyboardMap)
{
	var keyInput = noone;
	switch (keyboardMap)
	{
		case KeyMap.RIGHT:		keyInput = global.keyRight;	break;
		case KeyMap.LEFT:		keyInput = global.keyLeft;	break;
		case KeyMap.DOWN:		keyInput = global.keyDown;	break;
		case KeyMap.UP:			keyInput = global.keyUp;	break;
		case KeyMap.DASH:		keyInput = global.keyDash;	break;
		case KeyMap.JUMP:		keyInput = global.keyJump;	break;
		case KeyMap.ATTACK1:	keyInput = global.keyAtk1;	break;
		case KeyMap.ATTACK2:	keyInput = global.keyAtk2;	break;
		case KeyMap.CHANGE_L:	keyInput = global.ChangeL;	break;
		case KeyMap.CHANGE_R:	keyInput = global.ChangeR;	break;
		case KeyMap.MOVE_L:		keyInput = global.ChangeL;	break;
		case KeyMap.MOVE_R:		keyInput = global.ChangeR;	break;
	}
	return keyInput;
}