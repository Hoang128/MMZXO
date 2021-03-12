//State machine
viewStateMachine = instance_create_depth(x, y, depth, objStateMachine);
viewStateMachine.core = self;
viewStateMachine.coreType = "view";

targetObject = objGlobalManager.currentPlayer;
movePos = {x:0, y:0};
camSpeed = 4;

scrInitCamera();

with(viewStateMachine)
{
	fncStateChange(objViewStateFollow);
}