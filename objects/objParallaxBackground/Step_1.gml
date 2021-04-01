/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (inited)
{
	layer_background_speed(bgrTree, sprite.imgSpd * TIME_SCALE);
	/// @description Position
	if (region.enable)
	{
		if (instance_exists(objGameView))
		{
			if (collision_rectangle(region.x1, region.y1, region.x2, region.y2, objGameView, false, false))
			{
				layer_background_visible(bgrTree, 1);
			}
			else
				layer_background_visible(bgrTree, 0);
		}
	}
	else	
		layer_background_visible(bgrTree, 1);

	if customDepth==0{
	    if bgrLayer!=noone
		{
			var parallaxSpd = 0;
			switch (backgroundDepth)
			{
				case LayerDepthState.FOREGROUND:
					parallaxSpd = -0.5;	break;
				case LayerDepthState.BACKGROUND_1:
					parallaxSpd = 0.25;	break;	
				case LayerDepthState.BACKGROUND_2:
					parallaxSpd = 0.5;	break;	
				case LayerDepthState.BACKGROUND_3:
					parallaxSpd = 0.75;	break;	
				case LayerDepthState.BACKGROUND_4:
					parallaxSpd = 1.0;	break;	
			}
	        layer_x(bgrLayer, pos.x + VIEW_X * parallaxSpd);
	        layer_y(bgrLayer, pos.y + VIEW_Y * parallaxSpd);
		}
	}
	else{
	    if bgrLayer!=noone{
			if (spd.x == 0)
				layer_x(bgrLayer, VIEW_X - xOff);
			else
			{
				if (pos.x + spd.x * TIME_SCALE) < (pos.x + sprite_width)
				{
					layer_x(bgrLayer, pos.x + spd.x * TIME_SCALE);
					pos.x += spd.x * TIME_SCALE;
				}
				else
				{
					layer_x(bgrLayer, pos.x + spd.x * TIME_SCALE - sprite_width);
					pos.x += spd.x * TIME_SCALE - sprite_width;
				}
			}
			if (spd.y == 0)
			{
				layer_y(bgrLayer, VIEW_Y - yOff);
			}
			else
			{
				if (pos.y + spd.y * TIME_SCALE) < (pos.y + sprite_height)
				{
					layer_y(bgrLayer, pos.y + spd.y * TIME_SCALE);
					pos.y += spd.y * TIME_SCALE;
				}
				else
				{
					layer_y(bgrLayer, pos.y + spd.y * TIME_SCALE - sprite_height);
					pos.y += spd.y * TIME_SCALE - sprite_height;
				}
			}
		}
	}
}