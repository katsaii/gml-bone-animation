#macro SK_TYPE_IK_CONSTRAINT "ik_constraint"
enum sk_data_ik_constraint{
	name,
	joint,effector,chain,
	setupBendDir,setupWeight,
	appliedBendDir,appliedWeight
}
/// @desc initialise
/// @param variable
sk_ik_constraint_set_bones(argument0,undefined,undefined,false);
sk_ik_constraint_set_pose(argument0,SK_BEND_NEGATIVE,1);
sk_ik_constraint_setup(argument0);