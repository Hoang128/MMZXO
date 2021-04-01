/// @description Insert description here
// You can write your code in this editor
if (!inited)
{
	switch (backgroundDepth)
	{
		case LayerDepthState.FOREGROUND:
			bgrLayer = layer_create(-baseDepth - depthRatio * 1 + orderDepth);
			break;
		case LayerDepthState.BACKGROUND_1:
			bgrLayer = layer_create(baseDepth + depthRatio * 1 + orderDepth);
			break;
		case LayerDepthState.BACKGROUND_2:
			bgrLayer = layer_create(baseDepth + depthRatio * 2 + orderDepth);
			break;
		case LayerDepthState.BACKGROUND_3:
			bgrLayer = layer_create(baseDepth + depthRatio * 3 + orderDepth);
			break;
		case LayerDepthState.BACKGROUND_4:
			bgrLayer = layer_create(baseDepth + depthRatio * 4 + orderDepth);
			break;
	}
	sprite.imgSource = sprite_index;
	sprite.imgMax = image_number;
	bgrTree = layer_background_create(bgrLayer, sprite.imgSource);
	layer_background_xscale(bgrTree,image_xscale);
	layer_background_yscale(bgrTree,image_yscale);
	layer_background_visible(bgrTree,1);
	if (sprite.tileX == true)	
		layer_background_htiled(bgrTree, 1);
	else				
		layer_background_htiled(bgrTree, 0);
	if (sprite.tileY == true)	
		layer_background_vtiled(bgrTree, 1);
	else				
		layer_background_vtiled(bgrTree, 0);
	sprite_index=noone;
	inited = true;
}

else
{
	event_perform(ev_step_begin, 0);
}