#macro sk_type_constraint_physics sk_constraint_create_physics /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_PHYSICS{
	rigid, // if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob
	boneSystem,boneAnchor,boneEffector, // anchor is the bone the system will be attached to, the effector is where the bones will try to reach to
	XGrav,YGrav,drive,
	XGravFinal,YGravFinal,driveFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param anchor
var sk_struct = array_create(SK_CONSTRAINT_PHYSICS.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_physics,argument0,
	"sk_constraint_physics_setToSetupMix", // setup script
	"sk_constraint_physics_apply", // apply script
	"sk_constraint_destroy_physics" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_PHYSICS.boneSystem] = ds_list_create();
// set default property values
sk_constraint_physics_set_rigid(sk_struct,false);
sk_constraint_physics_set_bone_anchor(sk_struct,argument1);
sk_constraint_physics_set_bone_effector(sk_struct,noone);
sk_constraint_physics_set_gravity(sk_struct,0,0);
sk_constraint_physics_set_drive(sk_struct,1);
// apply transforms
sk_constraint_physics_setToSetupMix(sk_struct);
// return to caller
return sk_struct;