/// @description Insert description here
// You can write your code in this editor
if (global.debug)
{
	draw_set_color(c_white);
	draw_set_font(fontDebug);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(4, 24, "global time scale = " + string(global.timeScale) + " room speed = " + string(room_speed));
	if (instance_exists(objGlobalManager.currentPlayer))
	{
		draw_text(4, 48, "player spd = (" + string(objGlobalManager.currentPlayer.hspd) + ", " + string(objGlobalManager.currentPlayer.vspd));
		draw_text(4, 72, "player moveDir = (" + string(objGlobalManager.currentPlayer.hMove) + ", " + string(objGlobalManager.currentPlayer.vMove));
		draw_text(4, 96, "charge current 1 = " + string(objGlobalManager.currentPlayer.chargeWp1.Current));
		draw_text(4, 120, "jump time = " + string(objGlobalManager.currentPlayer.jumpTime));
		draw_text(4, 144, "state object number = " + string(instance_number(objState)));
		draw_text(4, 168, "state machine number = " + string(instance_number(objStateMachine)));
		draw_text(4, 192, "envi ratio = " + string(objGlobalManager.currentPlayer.physic.enviMoveRatio));
	}
}