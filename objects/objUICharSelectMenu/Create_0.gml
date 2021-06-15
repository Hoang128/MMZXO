/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

objUIManager.UICurrentInUse = self;
stageToGo = noone;
phase = 0;
charIconList = ds_list_create();
iconSpace = 400;
moveSpd = 80;
cursor = 0;
stageToGo = noone;

function fncUISelectChar()
{
	audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
	var charToGo = ds_list_find_value(charIconList, cursor).charObj;
	objGlobalManager.charToStart = charToGo;
		
	with (objRoomManager)
		fncChangeRoomTo(other.stageToGo, true);
	objUIManager.UICurrentInUse = noone;
}

function fncUIChangeCharTo(objChar)
{
	audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
	cursor = ds_list_find_index(charIconList, objChar.id);
	for (var i = 0; i < ds_list_size(charIconList); i++)
	{
		if (ds_list_find_value(charIconList, i).cursorOn == 1)
		{
			ds_list_find_value(charIconList, i).cursorOn = 0;
			ds_list_find_value(charIconList, i).depth += 1;
		}
	}
	
	objChar.cursorOn = 1;
	objChar.depth -= 1;
}

function fncUIChangeChar()
{
	if (fncStaticHandleButton(KeyMap.UI_LEFT,KeyAction.PRESSED))
	{
		if (cursor > 0)
		{
			audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
			cursor--;
			for (var i = 0; i < ds_list_size(charIconList); i++)
			{
				if (ds_list_find_value(charIconList, i).cursorOn == 1)
				{
					ds_list_find_value(charIconList, i).cursorOn = 0;
					ds_list_find_value(charIconList, i).depth += 1;
					ds_list_find_value(charIconList, i - 1).cursorOn = 1;
					ds_list_find_value(charIconList, i - 1).depth -= 1;
					break;
				}
			}
		}
	}
	
	if (fncStaticHandleButton(KeyMap.UI_RIGHT,KeyAction.PRESSED))
	{
		if (cursor < ds_list_size(charIconList) - 1)
		{
			audio_play_sound(UISFX.enterSFX, global.emitterSFX.source, false);
			cursor++;
			for (var i = 0; i < ds_list_size(charIconList); i++)
			{
				if (ds_list_find_value(charIconList, i).cursorOn == 1)
				{
					ds_list_find_value(charIconList, i).cursorOn = 0;
					ds_list_find_value(charIconList, i).depth += 1;
					ds_list_find_value(charIconList, i + 1).cursorOn = 1;
					ds_list_find_value(charIconList, i + 1).depth -= 1;
					break;
				}
			}
		}
	}
}

function fncUIExitCharSelectMenu()
{
	if (fncStaticHandleButton(KeyMap.UI_BACK,KeyAction.PRESSED))
	{
		phase = 4;
	}
}