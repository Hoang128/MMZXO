/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;

function fncStateStart()
{
	fncPlayerZXSlashCombo1Start();
}

function fncStateRun()
{
	fncPlayerZXSlashCombo1Run();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashCombo1End();
}

function fncPlayerZXSlashCombo1Start()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashCombo1;
		image_index = 0;
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash1, false, false);
		
		hspd = 0;
		vspd = 0;
	}
}

function fncPlayerZXSlashCombo1Run()
{
	if (slashEnd)
	{
		with(stateMachine)
			fncStateChange(objPlayerStateIdle);
	}
}

function fncPlayerZXSlashCombo1End()
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
			if (image_index > 5)
			{
				with(other.stateMachine)
					fncStateChange(objPlayerStateZXSlashCombo2);
			}
		}
	}
}