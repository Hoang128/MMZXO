/// @description Insert description here
// You can write your code in this editor
if (!inited)
{
	inited = true;
	
	currentSeq = layer_sequence_create(seqLayerName,VIEW_X, VIEW_Y, seqAnimation);
	layer_sequence_play(currentSeq);
}
else
{
	if (layer_sequence_is_finished(currentSeq))
	{
		instance_destroy();
	}
}