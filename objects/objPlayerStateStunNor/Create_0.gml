/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
stunTime = 10;

function fncStateStart()
{
	fncPlayerStunNorStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerStunNorRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerStunNorEnd();
}

function fncPlayerStunNorStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprStunNor;
		image_index = 0;
		
		hspd = -charDir;
		vspd = 0;
		
		audio_play_sound_on(global.emitterSFX.source, vfxPlayer.vfxHurt, false, false);
		
		with (weaponMeleeMgr)
			fncDestroyMeleeWeapon();
		
		
	}
}

function fncPlayerStunNorRun()
{
	with(core.id)
	{
		if (other.stunTime > 0)
			other.stunTime -= TIME_SCALE;
		else
		{
			if (physic.onGround)
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
				}
			}
			else
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateJump);
				}
			}
		}
	}
}

function fncPlayerStunNorEnd()
{
	
}

function fncWeaponHandle()
{
	if (!fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.HELD))
	{
		with(core.id)
			chargeWp1.Current = 0;
	}
	
	if (!fncStaticHandleButton(KeyMap.ATTACK2, KeyAction.HELD))
	{
		with(core.id)
			chargeWp2.Current = 0;
	}
}