/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 64;

damageRecord = 0;
damageRecordLimitSingle = 4;
damageRecordLimit = 8;

deadImageByBuster = noone;

inviTime = 0;
inviTimeMax = 180;

bossStateMachine = instance_create_depth(x, y, depth, objStateMachine);
bossStateMachine.core = self;

bossManager = noone;

bossBGM = bgmMMZLCrash;

lastMove = "no move";
moveRatio = ds_map_create();

function fncChangeDirToPlayer(player)
{
	if (instance_exists(player))
	{
		image_xscale = sign(player.x - x);
		if (image_xscale == 0)
			image_xscale = 1;
	}
}

function fncChooseMove()
{
	show_debug_message("choose move!");

	var arrVal = ds_map_values_to_array(moveRatio);
	var arrKey = ds_map_keys_to_array(moveRatio);
	
	var randomChoose = ds_list_create();
	
	for (var i = 0; i < array_length(arrVal); i++)
	{
		if (arrKey[i] == lastMove)
			continue;
		else
		{
			for (var j = 0; j < arrVal[i]; j++)
			{
				ds_list_add(randomChoose, arrKey[i]);
			}
		}
	}
	
	randomize();
	var rand = random(floor(ds_list_size(randomChoose)));
	
	fncGetBossMoveSequence(ds_list_find_value(randomChoose, rand));
	
	ds_list_destroy(randomChoose);
}

function fncGetBossMoveSequence(stringMove)
{
}