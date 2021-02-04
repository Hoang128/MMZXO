/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(4, 24, "global time scale = " + string(global.timeScale));
if (instance_exists(objPlayerZX))
{
	draw_text(4, 48, "hspd = " + string(objPlayerZX.hspd));
	draw_text(4, 72, "vspd = " + string(objPlayerZX.vspd));
	draw_text(4, 96, "charge current 1 = " + string(objPlayerZX.chargeWp1.Current));
	draw_text(4, 120, "charge current 2 = " + string(objPlayerZX.chargeWp2.Current));
	draw_text(4, 144, "sprite index = " + string(objPlayerZX.sprite_index));
	draw_text(4, 168, "image index = " + string(objPlayerZX.image_index));
}

if (instance_exists(objZXBusterFlareCtrl))
{
	draw_text(4, 144, "core fly speed = " + string(objZXBusterFlareCtrl.core.hspd * global.timeScale));
	draw_text(4, 168, "phase = " + string(objZXBusterFlareCtrl.phase));
}