/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
lastState = "default";

function fncStateStart()
{
	fncPlayerIdleStart();
}

function fncStateRun()
{
	fncStateInit();
	fncPlayerIdleRun();
	fncChangeToUniqueStates();
}

function fncStateEnd()
{
	fncPlayerIdleEnd();
}

function fncPlayerIdleStart()
{
	with(core.id)
	{	
		vspd = 0;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
		physic.onGround = true;
	}
}

function fncPlayerIdleRun()
{
	with(core.id)
	{
		if ((other.lastState == "dash") || (other.lastState == "slash dash"))
		{
			if (abs(hspd) > 0)	hspd -= dashAccDown * charDir;
			if ((hspd * charDir) <= 0)	hspd = 0;
		}
		
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
		
		if (fncStaticHandleButton(KeyMap.DASH, KeyAction.PRESSED))
		{
			if (!(place_meeting(x + charDir, y, objBlock) && (hMove == charDir))
			|| place_meeting(x + charDir, y, objSlope))
			{
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateDash);
					return;
				}
			}
		}
		
		if (hMove != 0)
		{
			if (!(place_meeting(x + charDir, y, objBlock) && (hMove == charDir))
			|| place_meeting(x + charDir, y, objSlope))
			{
				charDir = hMove;
				with(other.stateMachine)
				{
					fncStateChange(objPlayerStateRun);
					return;
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
		
		else if (vMove > 0)
		{
			var objCol = collision_rectangle(bbox_right, bbox_bottom, bbox_left, bbox_bottom + 1, objLadderTop, false, false);
			if (objCol != noone)
			{
				if ((abs(self.x - ((objCol.bbox_right + objCol.bbox_left)/2))) <= climbDistance)
				{
					x = (objCol.bbox_right + objCol.bbox_left)/2;
					y = objCol.bbox_top + ((bbox_bottom - bbox_top) / 2 + 2);
					fncIgnoreThinBlockFor(1);
					
					var climbFromFirstImageTemp = false;
					with(other.stateMachine)
					{
						fncStateChange(objPlayerStateClimb);
						currentState.climbFromFirstImage = climbFromFirstImageTemp;
						return;
					}
				}
			}
		}
	
		if (!physic.onGround)
		{
			jumpTime--;
			with(other.stateMachine)
			{
				fncStateChange(objPlayerStateJump);
				return;
			}
		}
	}
}

function fncPlayerIdleEnd()
{
}

function fncStateInit()
{
	if (!inited)
	{
		switch(lastState)
		{
			case "jump":	
			{
				with (core.id)
				{
					sprite_index = sprPlayer.sprLand;
					image_index = 0;
					hspd = 0;
				}
			}	break;
		
			case "dash":
			{
				with (core.id)
				{
					sprite_index = sprPlayer.sprDashEnd;
					image_index = 0;
				}
			}	break;
			
			case "slash dash":
			{
				with (core.id)
				{
					sprite_index = sprPlayer.sprDashEnd;
					image_index = 1;
				}
			}	break;
			
			default: 
			{
				with(core.id)
				{
					sprite_index = sprPlayer.sprIdle;
					image_index = 0;
					hspd = 0;	
				}
			}	break;
		}
		inited = true;
	}
}

function fncChangeToZXStates()
{
	
}