#macro SK_TYPE_PHYSICS_CONSTRAINT "physics_constraint"
enum sk_data_physics_constraint{
	name,
	rigid, // if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob
	system,
	anchor,
	effector, // anchor is the bone the system will be attached to, the effector is where the bones will try to reach to
	setupXGravity,setupYGravity,setupDrive,
	appliedXGravity,appliedYGravity,appliedDrive
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_physics_constraint.system] = ds_list_create();
sk_physics_constraint_set_rigid(argument0,false);
sk_physics_constraint_set_bones(argument0,undefined,undefined);
sk_physics_constraint_set_pose(argument0,0,0,1);
sk_physics_constraint_setup(argument0);