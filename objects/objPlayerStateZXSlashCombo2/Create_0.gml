/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;

function fncStateStart()
{
	fncPlayerZXSlashCombo2Start();
}

function fncStateRun()
{
	fncPlayerZXSlashCombo2Run();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashCombo2End();
}

function fncPlayerZXSlashCombo2Start()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashCombo2;
		image_index = 0;
		
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash2, false, false);
	}
}

function fncPlayerZXSlashCombo2Run()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashCombo2End()
{
	
}

function fncChangeToZXStates()
{
	if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
	{
		if (slashNext == false)
		{
			slashNext = true;
		}
	}
	
	if (slashNext)
	{
		with(core.id)
		{
			if (image_index > 6)
			{
				with(other.stateMachine)
					fncStateChange(objPlayerStateZXSlashCombo3);
			}
		}
	}
}