

fncStaticInitGame();

global.playerStartPosition.x = 120;
global.playerStartPosition.y = 80;

//room_goto(roomTest);

fncStaticCreateTextMessChain
(
	fncStaticCreateTextMessage
	(
		"Vent",
		sprMShotVentSmile,
		"let's make this more exciting!!!",
		sprMShotVentSmile,
		"hell yeah!!!"
	),
	
	fncStaticCreateTextMessage
	(
		"Vent",
		sprMShotVentWorry,
		"Show me your motivation!!!",
		sprMShotVentWorry,
		"come here!!!",
		sprMShotVentWorry,
		"this is my revenge!"
	)
)