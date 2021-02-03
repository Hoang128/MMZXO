/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
slashEnd = false;
slashNext = false;
dashJump = false;
shadowEffCreater = noone;

function fncStateStart()
{
	fncPlayerZXSlashSpinStart();
}

function fncStateRun()
{
	fncPlayerZXSlashSpinRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerZXSlashSpinEnd();
}

function fncPlayerZXSlashSpinStart()
{
	with(core.id)
	{
		sprite_index = sprPlayerZXSlashSpin;
		image_index = 0;
		
		audio_play_sound_on(global.emitterSFX.source, vfxVentSlash1, false, false);
	}
}

function fncPlayerZXSlashSpinRun()
{
	if (dashJump)
	{
		if (shadowEffCreater == noone)
		{
			shadowEffCreater = instance_create_depth(x, y, depth - 1, objPlayerShadowCreater);
			shadowEffCreater.core = self.core;
		}
	}
	with (core.id)
	{
		if (hMove != 0)
		{
			charDir = hMove;
		}
		
		var moveSpd = runSpd;
		if (other.dashJump)
			moveSpd = dashSpd;
		
		hspd = moveSpd * hMove;
		
		if (!fncStaticHandleButton(KeyMap.JUMP, KeyAction.HELD))
		{
			if (vspd < 0) vspd = 0;
		}
	
		if (vspd >= 0)
		{
			if (place_meeting(x + charDir, y, objBlock))
			{
				if (hMove == charDir)
				{
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateSlide);
						return;
					}
				}
			}
			
			if (physic.onGround)
			{
				sprite_index = sprPlayer.sprLand;
				image_index = 0;
				
				runSFXPlayer = instance_create_depth(x, y, depth, objPlayerRunSFXCreater);
				runSFXPlayer.core = self.id;
				
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
		}
	}
	
	if (slashEnd)
	{
		with(stateMachine)
		{
			var currentDashJump = currentState.dashJump;
			fncStateChange(objPlayerStateJump);
			currentState.dashJump = currentDashJump;
			return;
		}
	}
}

function fncPlayerZXSlashSpinEnd()
{
	if (instance_exists(shadowEffCreater))
		instance_destroy(shadowEffCreater);
}

function fncChangeToZXStates()
{
	if (fncStaticHandleButton(KeyMap.ATTACK1, KeyAction.PRESSED))
	{
		if (!slashNext)
			slashNext = true;
	}
	
	if (slashNext)
	{
		with(core.id)
		{
			if (image_index > 6)
			{
				with (other.stateMachine)
				{
					var currentDashJump = currentState.dashJump;
					fncStateChange(objPlayerStateZXSlashSpin);
					currentState.dashJump = currentDashJump;
					return;
				}
			}
		}
	}
}