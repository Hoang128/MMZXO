/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
intro = 00.00;
loop = 00.00;
stageBGM = noone;
tempBGM = noone;
playingBGM = noone;
currentBGM = noone;
init = 1;

function fncBGMSet(BGM, isStageTheme)
{
	//--------------------------------------------------
	if (BGM != currentBGM)
	{
		audio_stop_sound(currentBGM);
		if (isStageTheme == true)
		{
			stageBGM = BGM;
			currentBGM = stageBGM;
		}
		else
		{
			tempBGM = BGM;
			currentBGM = tempBGM;
		}
		
		fncGetBGMInfo(currentBGM);
        
		if (currentBGM != noone)
		{
			playingBGM = audio_play_sound_on(global.emitterBGM.source,currentBGM,0,0);
			if init init--;
		}
		else
		{
			fncBGMStop();
		}
	}
	//--------------------------------------------------
}

function fncBGMStop()
{
	if (audio_is_playing(currentBGM))
	{
		audio_stop_sound(currentBGM);
		currentBGM = noone;
	}
}

function fncGetBGMInfo(bgm)
{
	switch (bgm)
	{
		case bgmMMZ3Prismatic:
		{
			intro = 0.50;
			loop = 104.00;
		}	break;
			
		case bgmMMZLCrash:
		{
			intro = 13.50;
			loop = 77.40;
				
		}	break;

		case bgmMMZ3OldSpaceLife:
		{
			intro = 4.75;
			loop = 103.75;
		}	break;
		case noone:
		{
			intro = 0;
			loop = 0;
		}	break;
		default:
		{
			show_message("BGM is not resigned its intro and loop length in scr_BGMSet() function!");
		}	break;
	}
}

function fncBGMGetByRoom(roomGet){
	switch (roomGet)
	{
		case roomTest:	
			return bgmMMZ3OldSpaceLife;
			break;
		case roomStageSelect:
			return bgmMMZ3Prismatic;
			break;
		default:
			return noone;
	}
}