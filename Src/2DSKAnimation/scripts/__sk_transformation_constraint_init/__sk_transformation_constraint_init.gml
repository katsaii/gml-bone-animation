#macro SK_TYPE_TRANSFORMATION_CONSTRAINT "transformation_constraint"
enum sk_data_transformation_constraint{
	name,
	state,
	children,target,
	offsetX,offsetY,offsetXScale,offsetYScale,offsetShear,offsetRotation,
	setupMixTranslate,setupMixScale,setupMixShear,setupMixRotate,
	appliedMixTranslate,appliedMixScale,appliedMixShear,appliedMixRotate
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_transformation_constraint.children] = ds_list_create();
sk_transformation_constraint_set_target(argument0,undefined);
sk_transformation_constraint_set_state(argument0,false,false);
sk_transformation_constraint_set_offsets(argument0,0,0,0,0,0,0);
sk_transformation_constraint_set_pose(argument0,1,1,1,1);
sk_transformation_constraint_setup(argument0);