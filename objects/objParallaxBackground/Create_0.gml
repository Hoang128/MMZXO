/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

bgrLayer = noone;
bgrTree = noone;
customDepth = 0;

pos = 
{
	x : self.x,
	y : self.y
};

region =
{
	enable : false,
	x1 : 0, 
	y1 : 0,
	x2 : 0,
	y2 : 0
};

xOff = 0;
yOff = 0;

sprite =
{
	imgSource : noone,
	imgMax    : noone,
	imgIndex  : 0,
	imgSpd    : 30,
	tileX		: 0,
	tileY		: 0
};

spd = 
{
	x : 0,
	y : 0
};
baseDepth = 1000000;

backgroundDepth = LayerDepthState.BACKGROUND_1;
orderDepth = 0;

depthRatio = 100000;

inited = false;