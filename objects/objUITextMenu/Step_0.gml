/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (inited == 0)
{
	UIMessReader.contextNumber = array_length(UIMessContext);
	inited = 1;
}
else if (inited == 1)
{
	event_inherited();

	if (phase == 3)
	{
		if (UIMessReader.charCursorMax == 0)
		{
			UIMessReader.charCursorMax = string_length(UIMessContext[UIMessReader.contextCurrent]);
			UIMessReader.charCursor = 0;
			UIMessReader.messageIndex = "";
		}
		else
		{
			if (UIMessReader.charCursor < UIMessReader.charCursorMax)
			{
				var ratio = 1;
				if (keyboard_check(vk_anykey))
					ratio = 2;
				if ((UIMessReader.charCursor + ratio * UIMessReader.contextRevealSpd) < UIMessReader.charCursorMax)
					UIMessReader.charCursor += ratio * UIMessReader.contextRevealSpd;
				else
					UIMessReader.charCursor = UIMessReader.charCursorMax;
				UIMessReader.messageIndex = string_copy(UIMessContext[UIMessReader.contextCurrent], 0, floor(UIMessReader.charCursor));
			}
		}
		if (fncStaticHandleButton(KeyMap.UI_CONFIRM, KeyAction.PRESSED))
		{
			if (UIMessReader.charCursor == UIMessReader.charCursorMax)
			{
				if (UIMessReader.contextCurrent < (UIMessReader.contextNumber - 1))
				{
					UIMessReader.contextCurrent++;
					UIMessReader.charCursorMax = 0;
				}
				else
					phase = 4;
			}
		}
	}
}