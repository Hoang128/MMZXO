/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 30;

function fncChooseMove()
{
	show_debug_message("choose move!");

	var arrVal = ds_map_values_to_array(core.id.moveRatio);
	var arrKey = ds_map_keys_to_array(core.id.moveRatio);
	
	var randomChoose = ds_list_create();
	
	for (var i = 0; i < array_length(arrVal); i++)
	{
		if (arrKey[i] == core.id.lastMove)
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
	
	fncGetBatMoveSequence(ds_list_find_value(randomChoose, rand));
	
	ds_list_destroy(randomChoose);
}

function fncGetBatMoveSequence(stringMove)
{
	switch (stringMove)
	{
		case "release bat":
		{
			with (stateMachine)
			{
				fncStateEnqueue(objHBSStateFlyDown);
				fncStateEnqueue(objHBSStateSpamBat);
			}
		}	break;
		
		case "release sonic":
		{
			with (stateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
				fncStateEnqueue(objHBSStateSpamSonic);
			}
		}	break;
		
		case "teleport":
		{
			with (stateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
			}
		}	break;
		
		case "shot down":
		{
			with (stateMachine)
			{
				fncStateEnqueue(objHBSStateTele);
				fncStateEnqueue(objHBSStateShotDown);
				fncStateEnqueue(objHBSStateTeleAfterShot);
			}
		}	break;
		
		case "thunder clap":
		{
			with (stateMachine)
			{
				fncStateEnqueue(objHBSStateFlyDown);
				fncStateEnqueue(objHBSStateThunderClap);
				fncStateEnqueue(objHBSStateFlyUp);
			}
		}
	}
	with (stateMachine)
	{
		fncStateEnqueue(objHBSStateIdle);
	}
	
	core.id.lastMove = stringMove;
}

function fncStateStart()
{
	show_debug_message("hell bat schilt enter idle state");
	
	with(core.id)
	{
		sprite_index = sprHellBatFly;
		image_index = 0;
		
		fncChangeDirToPlayer(objGlobalManager.currentPlayer);
	}
}

function fncStateRun()
{
	with (core.id)
	{
		if (other.waitTime > 0)
		{
			other.waitTime -= TIME_SCALE;
		}
		else
		{
			with (other)
			{
				fncChooseMove();
				fncDoDequeueMove();
				if (core.id.lastMove == "release sonic")
				{
					stateMachine.currentState.customTele = "release sonic";
				}
				else if (core.id.lastMove == "shot down")
				{
					stateMachine.currentState.customTele = "shot down";
				}
				else if (core.id.lastMove == "thunder clap")
				{
					stateMachine.currentState.spaceToEarth = 0;
				}
			}
		}
	}
}

function fncStateEnd()
{
	
}