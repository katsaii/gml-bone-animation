#macro sk_type_constraint_ik sk_constraint_create_ik /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_IK{
	chain,boneJoint,boneEffector,
	bendDir,weight,
	bendDirFinal,weightFinal,
	sizeof
}
#macro sk_bendDir_positive 1
#macro sk_bendDir_negative -1
/// @desc creates a new structure and returns its reference
/// @param name
/// @param bone
/// @param effector
var sk_struct = array_create(SK_CONSTRAINT_IK.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_ik,argument0,
	"sk_constraint_ik_setToSetupMix", // setup script
	"sk_constraint_ik_apply", // apply script
	"sk_constraint_destroy_ik" // destruction script
);
// set default property values
sk_constraint_ik_set_mix(sk_struct,sk_bendDir_negative,1);
sk_constraint_ik_set_chain(sk_struct,false);
sk_constraint_ik_set_bone_joint(sk_struct,argument1);
sk_constraint_ik_set_bone_effector(sk_struct,argument2);
// apply transforms
sk_constraint_ik_setToSetupMix(sk_struct);
// return to caller
return sk_struct;