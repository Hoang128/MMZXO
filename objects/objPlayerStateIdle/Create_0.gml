/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function fncStateStart()
{
	with(core.id)
	{
		if (sprite_index != sprPlayer.sprLand)
		{
			sprite_index = sprPlayer.sprIdle;
			image_index = 0;
		}
		
		hspd = 0;
		vspd = 0;
		jumpTime = jumpTimeMax;
		airDashCount = airDashCountMax;
		physic.onGround = true;
	}
}

function fncStateRun()
{
	with(core.id)
	{
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
	
		if (keyboard_check_pressed(global.keyJump))
		{
			if (keyboard_check(global.keyDown))
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
					return;
				}
			}
		}
		
		if (keyboard_check_pressed(global.keyDash))
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

function fncStateEnd()
{
	
}