//State machine
viewStateMachine = instance_create_depth(x, y, depth, objStateMachine);
viewStateMachine.core = self;
viewStateMachine.coreType = "view";

targetObject = noone;

scrInitCamera();

with(viewStateMachine)
{
	fncStateChange(objViewStateFollow);
}