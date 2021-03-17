/// @description Insert description here
// You can write your code in this editor
function fncDrawUITitle(xPos, yPos, context)
{
	draw_set_font(UIContext.titleFont);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(xPos + UIContext.shadowDistance, yPos + UIContext.shadowDistance, context);
	}
	
	draw_set_color(c_white);
	draw_text(xPos, yPos, context);
	draw_set_color(c_white);
}

function fncDrawUIChildContext(xPos, yPos, childContext)
{
	draw_set_font(UIContext.childFont);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(xPos + UIContext.shadowDistance, yPos + UIContext.shadowDistance, childContext.context);
	}
	
	if (childContext.actived)
	{
		if (childContext.selected)
			draw_set_color(c_yellow);
		else
			draw_set_color(c_white);
	}	else	draw_set_color(c_gray);
	draw_text(xPos, yPos, childContext.context);
	draw_set_color(c_white);
}

if (UIBackground.actived)
{
	draw_set_color(UIBackground.backColor);
	draw_set_alpha(UIBackground.alpha);
	draw_rectangle(UIBackground.xStart, UIBackground.yStart, UIBackground.xEnd, UIBackground.yEnd, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}

if (phase == 3)
{
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	
	var xPos = UIBackground.xStart + UIContext.titleHMargin;
	var yPos = UIBackground.yStart + UIContext.titleVMargin;
	fncDrawUITitle(xPos, yPos, titleContext);

	var xStartPos = UIBackground.xStart + UIContext.childHMargin;
	var yStartPos = UIBackground.yStart + UIContext.titleVMargin * 2;

	for (var i = 0; i < ds_list_size(childMenuNodeList); i++)
	{
		var currentContext = ds_list_find_value(childMenuNodeList, i);
		xPos = xStartPos;
		yPos = yStartPos + UIContext.childVSpace * i;
	
		fncDrawUIChildContext(xPos, yPos, currentContext);
	}
}