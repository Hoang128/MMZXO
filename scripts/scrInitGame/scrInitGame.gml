// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fncStaticInitGame(){
	fncStaticInitDevParams();
	fncStaticInitStates();
	fncStaticInitWorldParams();
	fncInitGameplayParams();
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
	
	global.gameState = GameState.MENU;

	//Time
	global.timeScale = 1;
	global.timeScaleSlow = 0.2;
	
	//Physics
	global.gravAcc = 0.2;
	global.gravMax = 4;
	global.waterMoveRatio = {x : 0.8, y : 0.4};
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

function fncStaticInitScreenParams()
{
	window_set_size(960, 540);
	display_set_gui_size(VPORT_W, VPORT_H);
	window_set_position((display_get_width() - window_get_width()) / 2, (display_get_height() - window_get_height()) / 2);
	//gpu_set_texfilter(true);
}

function fncStaticInitSoundParams()
{
	global.emitterSFX = { source : noone, volume : 0.5 };
	global.emitterBGM = { source : noone, volume : 0.5 };
	
	global.emitterSFX.source = audio_emitter_create();
	global.emitterBGM.source = audio_emitter_create();
	
	global.emitterBGM.volume = 0;
	
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
	global.keyRight			= vk_numpad6;
	global.keyLeft			= vk_numpad4;
	global.keyUp			= vk_numpad8;
	global.keyDown			= vk_numpad5;
	
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
	global.kpRight			= gp_padr;
	global.kpLeft			= gp_padl;
	global.kpUp				= gp_padu;
	global.kpDown			= gp_padd;
	
	global.kpDash			= gp_shoulderl;
	global.kpJump			= gp_face1;
	global.kpAtk1			= gp_face3;
	global.kpAtk2			= gp_shoulderr;
	global.kpChangeL		= gp_shoulderlb;
	global.kpChangeR		= gp_shoulderrb;
	global.kpMoveL			= gp_face4;
	global.kpMoveR			= gp_face2;
	
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
	enum GameState
	{
		INGAME_CUTSCENE,
		INGAME_GAMEPLAY,
		CUTSCENE,
		MENU
	}
	
	enum RoomState
	{
		MENU,
		STAGE,
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
		MOVE_R,
		UI_LEFT,
		UI_RIGHT,
		UI_UP,
		UI_DOWN,
		UI_CONFIRM,
		UI_BACK,
		UI_CONFIRM_SUB,
		UI_BACK_SUB
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
	
	enum LayerDepthState
	{
		FOREGROUND,
		BACKGROUND_1,
		BACKGROUND_2,
		BACKGROUND_3,
		BACKGROUND_4
	}
	
	enum InWater
	{
		NONE,
		HALF,
		FULL
	}
	
	enum InWind
	{
		NONE,
		HALF,
		FULL
	}
}

function fncInitGameplayParams()
{
	global.defaultParams = 
	{
		playerHpMax : 16,
		playerWpMax : 16
	};
	
	global.itemsNumber = 
	{
		hpTank : 0,
		wpTank : 0,
		crystal : 0
	};
	
	global.upgradeItemEff =
	{
		hpTank : 2,
		wpTank : 2
	};
	
	global.eTank = array_create(4, false);
}

/// @function					fncStaticHandleButton(keyMap, keyAction);
/// @param {enum}  keyMap		The key mapped to control
/// @param {enum}  keyAction	Action player perform to the key
/// @description				use to control buttons in different platforms & devices.

function fncStaticHandleButton(keyMap, keyAction)
{
	if ((global.gameState == GameState.INGAME_GAMEPLAY) 
	 || (global.gameState == GameState.MENU))
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
	return false;
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
		var keyInput = fncStaticGetKeyPadMap(keyMap);
		
		if (gamepad_button_check(global.input.gamepadSlot, keyInput))
			handled = true;
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
		
		if (gamepad_button_check_pressed(global.input.gamepadSlot, keyInput))
			handled = true;
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
		
		if (gamepad_button_check_released(global.input.gamepadSlot, keyInput))
			handled = true;
	}
	return handled;
}

function fncStaticGetKeyBoardMap(keyboardMap)
{
	var keyInput = noone;
	switch (keyboardMap)
	{
		case KeyMap.RIGHT:			keyInput = global.keyRight;			break;
		case KeyMap.LEFT:			keyInput = global.keyLeft;			break;
		case KeyMap.DOWN:			keyInput = global.keyDown;			break;
		case KeyMap.UP:				keyInput = global.keyUp;			break;
		case KeyMap.DASH:			keyInput = global.keyDash;			break;
		case KeyMap.JUMP:			keyInput = global.keyJump;			break;
		case KeyMap.ATTACK1:		keyInput = global.keyAtk1;			break;
		case KeyMap.ATTACK2:		keyInput = global.keyAtk2;			break;
		case KeyMap.CHANGE_L:		keyInput = global.keyChangeL;		break;
		case KeyMap.CHANGE_R:		keyInput = global.keyChangeR;		break;
		case KeyMap.MOVE_L:			keyInput = global.keyMoveL;			break;
		case KeyMap.MOVE_R:			keyInput = global.keyMoveR;			break;
		case KeyMap.UI_RIGHT:		keyInput = global.keyUIRight;		break;
		case KeyMap.UI_LEFT:		keyInput = global.keyUILeft;		break;
		case KeyMap.UI_UP:			keyInput = global.keyUIUp;			break;
		case KeyMap.UI_DOWN:		keyInput = global.keyUIDown;		break;
		case KeyMap.UI_CONFIRM:		keyInput = global.keyUIConfirm;		break;
		case KeyMap.UI_CONFIRM_SUB:	keyInput = global.keyUIConfirmSub;	break;
		case KeyMap.UI_BACK:		keyInput = global.keyUIBack;		break;
		case KeyMap.UI_BACK_SUB:	keyInput = global.keyUIBackSub;		break;
	}
	return keyInput;
}

function fncStaticGetKeyPadMap(keyboardMap)
{
	var keyInput = noone;
	switch (keyboardMap)
	{
		case KeyMap.RIGHT:			keyInput = global.kpRight;			break;
		case KeyMap.LEFT:			keyInput = global.kpLeft;			break;
		case KeyMap.DOWN:			keyInput = global.kpDown;			break;
		case KeyMap.UP:				keyInput = global.kpUp;				break;
		case KeyMap.DASH:			keyInput = global.kpDash;			break;
		case KeyMap.JUMP:			keyInput = global.kpJump;			break;
		case KeyMap.ATTACK1:		keyInput = global.kpAtk1;			break;
		case KeyMap.ATTACK2:		keyInput = global.kpAtk2;			break;
		case KeyMap.CHANGE_L:		keyInput = global.kpChangeL;		break;
		case KeyMap.CHANGE_R:		keyInput = global.kpChangeR;		break;
		case KeyMap.MOVE_L:			keyInput = global.kpMoveL;			break;
		case KeyMap.MOVE_R:			keyInput = global.kpMoveR;			break;
		case KeyMap.UI_RIGHT:		keyInput = global.kpUIRight;		break;
		case KeyMap.UI_LEFT:		keyInput = global.kpUILeft;			break;
		case KeyMap.UI_UP:			keyInput = global.kpUIUp;			break;
		case KeyMap.UI_DOWN:		keyInput = global.kpUIDown;			break;
		case KeyMap.UI_CONFIRM:		keyInput = global.kpUIConfirm;		break;
		case KeyMap.UI_CONFIRM_SUB:	keyInput = global.kpUIConfirmSub;	break;
		case KeyMap.UI_BACK:		keyInput = global.kpUIBack;			break;
		case KeyMap.UI_BACK_SUB:	keyInput = global.kpUIBackSub;		break;
	}
	return keyInput;
}

function fncStaticKeyToString(key) {
	var returnStr= "";
	switch (key)
	{
		case vk_enter:		returnStr = "ENTER"; break;
		case vk_space:		returnStr = "SPACE"; break;
		case vk_lshift:		returnStr = "LEFT SHIFT"; break;
		case vk_rshift:		returnStr = "RIGHT SHIFT"; break;
		case vk_lalt:		returnStr = "LEFT ALT"; break;
		case vk_ralt:		returnStr = "RIGHT ALT"; break;
		case vk_lcontrol:	returnStr = "LEFT CTRL"; break;
		case vk_rcontrol:	returnStr = "RIGHT CTRL"; break;
		case vk_tab:		returnStr = "TAB"; break;
		case vk_numpad0:	returnStr = "NUMPAD 0"; break;
		case vk_numpad1:	returnStr = "NUMPAD 1"; break;
		case vk_numpad2:	returnStr = "NUMPAD 2"; break;
		case vk_numpad3:	returnStr = "NUMPAD 3"; break;
		case vk_numpad4:	returnStr = "NUMPAD 4"; break;
		case vk_numpad5:	returnStr = "NUMPAD 5"; break;
		case vk_numpad6:	returnStr = "NUMPAD 6"; break;
		case vk_numpad7:	returnStr = "NUMPAD 7"; break;
		case vk_numpad8:	returnStr = "NUMPAD 8"; break;
		case vk_numpad9:	returnStr = "NUMPAD 9"; break;
		case vk_pageup:		returnStr = "PAGE UP"; break;
		case vk_pagedown:	returnStr = "PAGE DOWN"; break;
		case vk_home:		returnStr = "HOME"; break;
		case vk_end:		returnStr = "END"; break;
		case vk_decimal:	returnStr = "NUMPAD ."; break;
		case vk_delete:		returnStr = "DELETE"; break;
		case vk_divide:		returnStr = "NUMPAD DIVINE"; break;
		case vk_escape:		returnStr = "ESC"; break;
		case vk_subtract:	returnStr = "NUMPAD SUBTRACT"; break;
		case vk_multiply:	returnStr = "NUMPAD MULTIPLY"; break;
		case vk_add:		returnStr = "NUMPAD ADD"; break;
		case vk_backspace:  returnStr = "BACKSPACE"; break;
		case vk_right:		returnStr = "RIGHT ARROW"; break;
		case vk_left:		returnStr = "LEFT ARROW"; break;
		case vk_up:			returnStr = "UP ARROW"; break;
		case vk_down:		returnStr = "DOWN ARROW"; break;
		case vk_f1:			returnStr = "F1"; break;
		case vk_f2:			returnStr = "F2"; break;
		case vk_f3:			returnStr = "F3"; break;
		case vk_f4:			returnStr = "F4"; break;
		case vk_f5:			returnStr = "F5"; break;
		case vk_f6:			returnStr = "F6"; break;
		case vk_f7:			returnStr = "F7"; break;
		case vk_f8:			returnStr = "F8"; break;
		case vk_f9:			returnStr = "F9"; break;
		case vk_f10:		returnStr = "F10"; break;
		case vk_f11:		returnStr = "F11"; break;
		case vk_f12:		returnStr = "F12"; break;
		case 189:			returnStr = "DASH"; break;
		case 187:			returnStr = "ADD"; break;
		case 188:			returnStr = "COMMA"; break;
		case 190:			returnStr = "DOT"; break;
		case 191:			returnStr = "FOWARD SLASH"; break;
		case 186:			returnStr = "SEMI-COLON"; break;
		case 222:			returnStr = "GRAVIS"; break;
		case 219:			returnStr = "L.SQUARE BRACKET"; break;
		case 220:			returnStr = "BACKWARD SLASH"; break;
		case 221:			returnStr = "R.SQUARE BRACKET"; break;
		case 192:			returnStr = "TILDE"; break;
		case noone:			returnStr = " "; break;
		default:			returnStr = chr(key); break;
	}

	return returnStr;
}
