/// @description Insert description here
// You can write your code in this editor

if (!init)
{
    var pos = audio_sound_get_track_position(playingBGM);
    var bgmLength = intro + loop;
    if (pos >= bgmLength)
	{
		pos = bgmLength;
		audio_sound_set_track_position(playingBGM, pos - loop);
	}
}