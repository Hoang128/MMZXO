// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticInitGame(){
	fncStaticInitDevParams();
	fncStaticInitWorldParams();
	fncStaticInitGeneralParams();
	fncStaticInitInputParams();
	fncStaticInitScreenParams();
	fncStaticInitSoundParams();
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
	#macro VIEW_X camera_get_view_x(view_camera)
	#macro VIEW_Y camera_get_view_y(view_camera)
	#macro VPORT_W 1920
	#macro VPORT_H 1080
	#macro ACTIVE_X camera_get_view_x(view_camera) - 340
	#macro ACTIVE_Y camera_get_view_y(view_camera) - 192
	#macro ACTIVE_W 340 * 3
	#macro ACTIVE_H 192 * 3
	
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

function fncStaticInitGeneralParams()
{
	global.hpMax = 16;
	global.mpMax = 16;
	global.crystal = 0;
}

function fncStaticInitScreenParams()
{
	window_set_size(960, 540);
}

function fncStaticInitSoundParams()
{
	global.emitterSFX = { source : noone, volume : 0.5 };
	global.emitterBGM = { source : noone, volume : 0.5 };
	
	global.emitterSFX.source = audio_emitter_create();
	global.emitterBGM.source = audio_emitter_create();
	
	audio_emitter_gain(global.emitterSFX.source, global.emitterSFX.volume);
	audio_emitter_gain(global.emitterBGM.source, global.emitterBGM.volume);
}

function fncStaticInitInputParams()
{
	global.input = 
	{
		keyboard : true,
		gamepad : false,
		gamepadSlot : -1
	};
	fncStaticInitKeyboardParams();
	fncStaticInitKeypadParams();
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

function fncStaticInitKeypadParams()
{
	global.kpRight			= (gamepad_axis_value(0, gp_axislh) == 1);
	global.kpLeft			= (gamepad_axis_value(0, gp_axislh) == -1);
	global.kpUp				= (gamepad_axis_value(0, gp_axislv) == -1);
	global.kpDown			= (gamepad_axis_value(0, gp_axislv) == 1);
	
	global.kpDash			= gp_shoulderrb;
	global.kpJump			= gp_face2;
	global.kpAtk1			= gp_face3;
	global.kpAtk2			= gp_face1;
	global.kpChangeL		= gp_shoulderl;
	global.kpChangeR		= gp_shoulderr;
	global.kpMoveL			= gp_face4;
	global.kpMoveR			= gp_shoulderlb;
	
	global.kpUIRight		= gp_padr;
	global.kpUILeft			= gp_padl;
	global.kpUIUp			= gp_padu;
	global.kpUIDown			= gp_padd;
	global.kpUIConfirm		= gp_start;
	global.kpUIBack			= gp_select;
	global.kpUIConfirmSub	= gp_face1;
	global.kpUIBackSub		= gp_face2;
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
	
	enum PlayerWeaponType
	{
		MELEE,
		BUSTER,
		OBJECTIVE
	}
	
	enum Element
	{
		FIRE,
		ICE,
		ELECT,
		NEUTRAL,
		DARK
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
	var handled = false;
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check(keyInput))
		handled = true;
	}
	if (global.input.gamepad)
	{
		//show_debug_message("axislh = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislh)));
		//show_debug_message("axislv = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislv)));
		var keyInput = fncStaticGetKeyPadMap(keyMap);
		if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
		{
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)))
			{
				show_debug_message("axislh = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislh)));
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) > 0)
				{
					show_debug_message("left analog right");
					handled = true;
				}
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)))
			{
				show_debug_message("axislh = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislh)));
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) < 0)
				{
					show_debug_message("left analog left");
					handled = true;
				}
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)))
			{
				show_debug_message("axislv = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislv)));
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) > 0)
				{
					show_debug_message("left analog up");
					handled = true;
				}
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
			{
				show_debug_message("axislv = " + string(gamepad_axis_value(global.input.gamepadSlot, gp_axislv)));
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) < 0)
				{
					show_debug_message("left analog down");
					handled = true;
				}
			}
		}
		else
		{
			if (gamepad_button_check(global.input.gamepadSlot, keyInput))
				handled = true;
		}
	}
	
	return handled;
}

/// @function					fncStaticHandleButtonPressed(keyMap);
/// @param {enum}  keyMap		The key mapped to control
/// @description				use to control buttons pressed in different platforms & devices.
function fncStaticHandleButtonPressed(keyMap)
{
	var handled = false;
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check_pressed(keyInput))
			handled = true;
	}
	if (global.input.gamepad)
	{
		var keyInput = fncStaticGetKeyPadMap(keyMap);
		if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
		{
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)
					handled = true;
			}
		}
		else
		{
			if (gamepad_button_check_pressed(global.input.gamepadSlot, keyInput))
				handled = true;
		}
	}
	
	return handled;
}

/// @function					fncStaticHandleButtonReleased(keyMap);
/// @param {enum}  keyMap		The key mapped to control
/// @description				use to control buttons released in different platforms & devices.

function fncStaticHandleButtonReleased(keyMap)
{
	var handled = false;
	if (global.input.keyboard)
	{
		var keyInput = fncStaticGetKeyBoardMap(keyMap);
		if (keyboard_check_released(keyInput))
			handled = true;
	}
	if (global.input.gamepad)
	{
		var keyInput = fncStaticGetKeyPadMap(keyMap);
		if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)) ||
			(keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
		{
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == 1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) != 1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) == -1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislh) != -1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == 1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) != 1)
					handled = true;
			}
			if ((keyInput == (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) == -1)))
			{
				if (gamepad_axis_value(global.input.gamepadSlot, gp_axislv) != -1)
					handled = true;
			}
		}
		else
		{
			if (gamepad_button_check_released(global.input.gamepadSlot, keyInput))
				handled = true;
		}
	}
	return handled;
}

function fncStaticGetKeyBoardMap(keyboardMap)
{
	var keyInput = noone;
	switch (keyboardMap)
	{
		case KeyMap.RIGHT:		keyInput = global.keyRight;		break;
		case KeyMap.LEFT:		keyInput = global.keyLeft;		break;
		case KeyMap.DOWN:		keyInput = global.keyDown;		break;
		case KeyMap.UP:			keyInput = global.keyUp;		break;
		case KeyMap.DASH:		keyInput = global.keyDash;		break;
		case KeyMap.JUMP:		keyInput = global.keyJump;		break;
		case KeyMap.ATTACK1:	keyInput = global.keyAtk1;		break;
		case KeyMap.ATTACK2:	keyInput = global.keyAtk2;		break;
		case KeyMap.CHANGE_L:	keyInput = global.keyChangeL;	break;
		case KeyMap.CHANGE_R:	keyInput = global.keyChangeR;	break;
		case KeyMap.MOVE_L:		keyInput = global.keyMoveL;		break;
		case KeyMap.MOVE_R:		keyInput = global.keyMoveR;		break;
	}
	return keyInput;
}

function fncStaticGetKeyPadMap(keyboardMap)
{
	var keyInput = noone;
	switch (keyboardMap)
	{
		case KeyMap.RIGHT:		keyInput = global.kpRight;		break;
		case KeyMap.LEFT:		keyInput = global.kpLeft;		break;
		case KeyMap.DOWN:		keyInput = global.kpDown;		break;
		case KeyMap.UP:			keyInput = global.kpUp;			break;
		case KeyMap.DASH:		keyInput = global.kpDash;		break;
		case KeyMap.JUMP:		keyInput = global.kpJump;		break;
		case KeyMap.ATTACK1:	keyInput = global.kpAtk1;		break;
		case KeyMap.ATTACK2:	keyInput = global.kpAtk2;		break;
		case KeyMap.CHANGE_L:	keyInput = global.kpChangeL;	break;
		case KeyMap.CHANGE_R:	keyInput = global.kpChangeR;	break;
		case KeyMap.MOVE_L:		keyInput = global.kpMoveL;		break;
		case KeyMap.MOVE_R:		keyInput = global.kpMoveR;		break;
	}
	return keyInput;
}