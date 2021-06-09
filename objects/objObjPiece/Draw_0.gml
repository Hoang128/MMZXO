/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (palette != noone)
	fncStaticPalSwapSet(palette, paletteNumber, false);

draw_self();

if (palette != noone)
	fncStaticPalSwapReset();