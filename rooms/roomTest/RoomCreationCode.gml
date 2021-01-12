fncStaticInitGame();
window_set_size(800,450);
window_set_position((1366-800) / 2, (768 - 450) / 2);

global.playerStartPosition.x = 120;
global.playerStartPosition.y = 80;

scrStaticInitRoom(RoomState.STAGE);