/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(4, 24, "global time scale = " + string(global.timeScale));
if (instance_exists(objPlayerZX))
{
	draw_text(4, 48, "can shot = " + string(objPlayerZX.canShot));
	draw_text(4, 72, "flare shot phase = " + string(objPlayerZX.flareShotPhase));
	draw_text(4, 96, "flare shot time = " + string(objPlayerZX.flareShotTime));
	draw_text(4, 120, "shot anim wait = " + string(objPlayerZX.shotAnimWait));
	draw_text(4, 144, "shot anim phase = " + string(objPlayerZX.shotAnimPhase));
}