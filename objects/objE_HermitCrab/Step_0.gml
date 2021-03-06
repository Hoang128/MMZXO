/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case hermitCrabState.INIT:
	{
		/*
		if (image_yscale > 0)
			move_contact_solid(270, 0);
		else
			move_contact_solid(90, 0);
		*/
		if (collision_rectangle(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, self, false, false))
		{
			fncChangeDirToCam();
			guard = 0.5;
			guardDir = 90 + 90 * image_xscale;
			state = hermitCrabState.IDLE;
			waitTime = waitIdleMax;
		}
	}	break;
	
	case hermitCrabState.IDLE:
	{
		if (waitTime > 0)
			waitTime -= TIME_SCALE;
		else
		{
			state = hermitCrabState.RUN;
			sprite_index = sprHermitCrabRun;
			image_index = 0;
			hspd = image_xscale * runSpd;
			guard = 0.5;
			guardDir = 90 + 90 * image_xscale;
			
		}
	}	break;
	
	case hermitCrabState.RUN:
	{
		if (waitToShot > 0)
		{
			waitToShot -= TIME_SCALE;
		}
		else
			waitToShot = 0;
		if (fncIsReadyToAttack(objGlobalManager.currentPlayer))
		{
			if (waitToShot == 0)
			{
				state = hermitCrabState.CLOSE_SHELL;
				sprite_index = sprHermitCrabCloseShell;
				image_index = 0;
				hspd = 0;
				isCloseShellToShot = true;
				guard = 0.5;
				guardDir = 90 + 90 * image_xscale;
				
				waitToShot = waitToShotmax;
			}
		}
		if (fncIsWallAhead(image_xscale, image_yscale) || !fncIsFloorAhead(image_xscale, maxDisDetectSlopeAbove, image_yscale))
		{
			state = hermitCrabState.CLOSE_SHELL;
			sprite_index = sprHermitCrabCloseShell;
			image_index = 0;
			hspd = 0;
			guard = 0.5;
			guardDir = 90 + 90 * image_xscale;
			isCloseShellToShot = false;
		}
	}	break;
	
	case hermitCrabState.IN_SHELL:
	{
		if (waitTime > 0)
			waitTime -= TIME_SCALE;
		else
		{
			if (isCloseShellToShot)
			{
				fncChangeDirToCam();
				state = hermitCrabState.SHOT;
				sprite_index = sprHermitCrabShot;
				image_index = 0;
				guard = 0;
			}
			else
			{
				image_xscale *= -1;
				state = hermitCrabState.OPEN_SHELL;
				sprite_index = sprHermitCrabOpenShell;
				image_index = 0;
				guard = 0.5;
				guardDir = 90 + 90 * image_xscale;
			}
		}
	}	break;
	
	case hermitCrabState.CLOSE_SHELL:
	{
	}	break;
	
	case hermitCrabState.OPEN_SHELL:
	{
	}	break;
	
	case hermitCrabState.SHOT:
	{
		if ((image_index > 7) && (image_index < 9))
			fncCreateHCArrow(0);
		if ((image_index > 10) && (image_index < 12))
			fncCreateHCArrow(1);
		if ((image_index > 13) && (image_index < 15))
			fncCreateHCArrow(2);
	}	break;
}