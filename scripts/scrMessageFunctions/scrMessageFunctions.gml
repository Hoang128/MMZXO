// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function fncStaticCreateTextMessChain() 
{
	if (argument_count==0) return noone;

	if (!instance_exists(objUITextChainMenu))
	{
	    var textChainIns = instance_create_depth(0, 0, -10000, objUITextChainMenu);
	    textChainIns.messChain = argument_count;
	    for (i = 0; i < argument_count; i++)
		{
	           textChainIns.messArr[i] = argument[i];
	    }
		
		return textChainIns;
	}
}

function fncStaticCreateTextMessage()
{
	if (argument_count <= 1) return noone;
	
	else
	{
		var mess = instance_create_depth(0, 0, -10000, objUITextMenu);
		mess.titleContext = argument[0];
		for (i = 1; i < argument_count; i+=2)
		{
			mess.UIAvatarImage[(i + 1)/2 - 1] = argument[i];
			mess.UIMessContext[(i + 1)/2 - 1] = argument[i + 1];
		}
		return mess;
	}
}
