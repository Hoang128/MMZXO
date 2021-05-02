/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

menuCursor = -1;

titleContext = "Mission Result";
UIAnim.closeMenuCloseEff = objSceneFadeInColor;

UIBackground.xStart = 120;
UIBackground.yStart = 120;
UIBackground.UIWidth = 1680;
UIBackground.UIHeight = 840;

fncInitUIChildMenuNode("Time: ", noone, noone, true);
fncInitUIChildMenuNode("Damage got: ", noone, noone, true);
fncInitUIChildMenuNode("Enemies eliminated: ", noone, noone, true);
fncInitUIChildMenuNode("Total score: ", noone, noone, true);

function fncUIExit()
{
	if (keyboard_check_pressed(vk_anykey))
	{
		fncUICloseMenu();
	}
}
