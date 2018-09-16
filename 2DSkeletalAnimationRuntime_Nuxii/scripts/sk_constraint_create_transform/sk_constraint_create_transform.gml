#macro sk_type_constraint_transform sk_constraint_create_transform /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_TRANSFORM{
	local,relative,boneChildren,boneTarget,
	X,Y,XScale,YScale,YShear,rotation,
	translateMix,scaleMix,shearMix,rotateMix,
	translateMixFinal,scaleMixFinal,shearMixFinal,rotateMixFinal,
	sizeof
}
/// @desc creates a new structure and returns its reference
/// @param name
/// @param targetBone
var sk_struct = array_create(SK_CONSTRAINT_TRANSFORM.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_transform,argument0,
	"sk_constraint_transform_setToSetupMix", // setup script
	"sk_constraint_transform_apply", // apply script
	"sk_constraint_destroy_transform" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_TRANSFORM.boneChildren] = ds_list_create(); // create list for storing children
// set default property values
sk_constraint_transform_set_local(sk_struct,false);
sk_constraint_transform_set_relative(sk_struct,false);
sk_constraint_transform_set_bone_target(sk_struct,argument1);
sk_constraint_transform_set_offset(sk_struct,0,0,0,0,0,0);
sk_constraint_transform_set_mix(sk_struct,1,1,1,1);
// apply transforms
sk_constraint_transform_setToSetupMix(sk_struct);
// return to caller
return sk_struct;