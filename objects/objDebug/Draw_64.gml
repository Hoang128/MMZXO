/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(4, 24, "global time scale = " + string(global.timeScale));
if (instance_exists(objPlayerZX))
{
	draw_text(4, 48, "image speed = " + string(objPlayerZX.image_speed));
	draw_text(4, 72, "can shot = " + string(objPlayerZX.canShot));
	draw_text(4, 96, "charge current 1 = " + string(objPlayerZX.chargeWp1.Current));
	draw_text(4, 120, "charge current 2 = " + string(objPlayerZX.chargeWp2.Current));
	//draw_text(4, 144, "shot anim wait = " + string(objPlayerZX.shotAnimWait));
	//draw_text(4, 168, "shot anim phase = " + string(objPlayerZX.shotAnimPhase));
}