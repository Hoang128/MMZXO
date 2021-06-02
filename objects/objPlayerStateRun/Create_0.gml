/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	fncPlayerRunStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerRunRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerRunEnd();
}

function fncPlayerRunStart()
{
	with(core.id)
	{
		sprite_index = sprPlayer.sprRun;
		image_index = 0;
		
		if (runSFXPlayer == noone)
		{
			runSFXPlayer = instance_create_depth(x, y, depth, objPlayerRunSFXCreater);
			runSFXPlayer.core = self.id;
		}
	}
}

function fncPlayerRunRun()
{
	with(core.id)
	{	
		if (!physic.onGround)
		{
			jumpTime--;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
		
		hspd = runSpd * charDir;
		
		if ((!instance_exists(weaponMeleeMgr)) || (weaponMeleeMgr.weaponSlash == noone))
		{
			if (fncStaticHandleButton(KeyMap.JUMP, KeyAction.PRESSED))
			{
				if (fncStaticHandleButton(KeyMap.DOWN, KeyAction.HELD))
				{
					if (fncIsOnBlockThin(1))
					{
						if (!fncIsOnBlock(1))
						{
							y+=2;
							jumpTime--;
							physic.onGround = false;
							fncIgnoreThinBlockFor(physic.thinBlockIgnoreTimeMax);
							with(other.stateMachine)
							{
								fncStateChange(objPlayerStateJump);
								return;
							}
						}
					}
				}
				if (jumpTime > 0)
				{
					vspd = -jumpSpd;
					jumpTime--;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateJump);
						currentState.dashJump = fncStaticHandleButton(KeyMap.DASH, KeyAction.HELD);
						return;
					}
				}
			}
		
			if (hMove == 0)
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateIdle);
					return;
				}
			}
			else
			{
				if (charDir != hMove)
					charDir = hMove;
				if (place_meeting(x + charDir, y, objBlock))
				{
					if (!place_meeting(x + charDir * maxDisDetectSlopeAbove, y, objSlope))
					{
						with(other.stateMachine)
						{
							fncStateChange(objPlayerStateIdle);
							return;
						}
					}
				}
			}
		
			if (vMove < 0)
			{
				if (canClimb)
				{
					var objCol = collision_rectangle(bbox_right, (bbox_top + bbox_bottom) / 2, bbox_left, bbox_bottom, objLadder, false, false);
					if (objCol != noone)
					{
						if ((abs(self.x - ((objCol.bbox_right + objCol.bbox_left)/2))) <= climbDistance)
						{
							x = (objCol.bbox_right + objCol.bbox_left)/2;
				
							with(other.stateMachine)
							{
								fncStateChange(objPlayerStateClimb);
								return;
							}
						}
					}
				}
			}
		
			if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateDash);
					return;
				}
			}
		}
	}
}

function fncPlayerRunEnd()
{

}

function fncChangeToZXStates()
{

}