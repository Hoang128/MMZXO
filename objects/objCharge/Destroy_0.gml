/// @description Insert description here
// You can write your code in this editor
if ((core.chargeWp1.Current < core.chargeWp1.Mid) && (core.chargeWp2.Current < core.chargeWp2.Mid))
	if (audio_is_playing(sfxChargeEff))
		audio_stop_sound(sfxChargeEff);