/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 30;

function fncChooseMove()
{
	show_debug_message("choose move!");
	
	var randTotal = 0;
	
	var arrVal = ds_map_values_to_array(core.id.moveRatio);
	var arrKey = ds_map_keys_to_array(core.id.moveRatio);
	
	with (core.id)
	{
		for (var i = 0; i < array_length(arrVal); i++)
		{
			if (arrKey[i] != lastMove)
			{
				randTotal += arrVal[i];
			}
		}
	}
	
	var randChoose = array_create(randTotal, "none");
	
	var counter = arrVal[0];
	var subCounter = 0;
	for (var i = 0; i < array_length(randChoose); i++)
	{
		if (i >= counter)
		{
			subCounter++;
			counter += arrVal[subCounter];
		}
		
		if (arrKey[subCounter] == core.id.lastMove)
			continue;
		randChoose[i] = arrKey[subCounter];
	}
	
	randomize();
	var rand = floor(random(randTotal));
	
	fncGetBatMoveSequence(randChoose[rand]);
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
					stateMachine.currentState.customTele = true;
				}
			}
		}
	}
}

function fncStateEnd()
{
	
}