/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

UIContext.titleFont = fontMenuM;
UIContext.childFont = fontMenuS;

UIContext.childVSpace = 96;
UIContext.titleVMargin = 128;

UIBackground.xStart = 668;
UIBackground.yStart = 64;
UIBackground.UIWidth = 1188;
UIBackground.UIHeight = 952;

UIMenuLimit.actived = true;
UIMenuLimit.maxRow = 5;

titleContext = "Cài đặt bàn phím";
fncInitUIChildMenuNode("Di chuyển trái", noone, noone, true);
fncInitUIChildMenuNode("Di chuyển phải", noone, noone, true);
fncInitUIChildMenuNode("Di chuyển lên", noone, noone, true);
fncInitUIChildMenuNode("Di chuyển xuống", noone, noone, true);
fncInitUIChildMenuNode("Nhảy", noone, noone, true);
fncInitUIChildMenuNode("Trượt", noone, noone, true);
fncInitUIChildMenuNode("Dùng vũ khí 1", noone, noone, true);
fncInitUIChildMenuNode("Dùng vũ khí 2", noone, noone, true);
fncInitUIChildMenuNode("Tuyệt chiêu 1", noone, noone, true);
fncInitUIChildMenuNode("Tuyệt chiêu 2", noone, noone, true);
fncInitUIChildMenuNode("Đổi dạng", noone, noone, true);
fncInitUIChildMenuNode("Xem bản đồ", noone, noone, true);

function fncUIHandleExit()
{
	fncUICloseMenu();
}