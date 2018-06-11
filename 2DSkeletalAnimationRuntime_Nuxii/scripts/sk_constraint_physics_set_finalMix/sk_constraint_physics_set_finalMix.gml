/// @desc sets the setup mix for the constraint
/// @param constraint
/// @param gravity
/// @param direction
/// @param dampingRatio
argument0[@ SK_CONSTRAINT_PHYSICS.XGravFinal] = argument1*dcos(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.YGravFinal] = -argument1*dsin(argument2);
argument0[@ SK_CONSTRAINT_PHYSICS.driveFinal] = argument3;