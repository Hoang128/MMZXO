/// @description Insert description here
// You can write your code in this editor

physicVisible = 
{
	blockNor : true,
	blockThin : true,
	ladder : true,
	player : false
}

function fncChangeBlocksVisible(changeToVisible)
{
	if (changeToVisible)
	{
		with(objBlock)
			visible = true;
		with(objBlockThin)
			visible = true;
		with(objLadder)
			visible = true;
		with(objLadderTop)
			visible = true;
		physicVisible.blockNor = true;
	}
	else
	{
		with(objBlock)
			visible = false;
		with(objBlockThin)
			visible = false;
		with(objLadder)
			visible = false;
		with(objLadderTop)
			visible = false;
		physicVisible.blockNor = false;
	}
}