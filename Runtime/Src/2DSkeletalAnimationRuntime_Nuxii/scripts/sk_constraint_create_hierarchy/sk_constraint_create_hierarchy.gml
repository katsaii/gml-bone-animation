#macro sk_type_constraint_hierarchy sk_constraint_create_hierarchy /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_CONSTRAINT_HIERARCHY{
	boneParentTuples, /* a list of 2 record tuple consisting of a bone and the id of its parent */
	displayKey,
	displayKeyFinal,
	sizeof
}
#macro sk_tuple_boneParent_bone 0
#macro sk_tuple_boneParent_parent 1
#macro sk_tuple_boneParent_ENTRIES 2
/// @desc creates a new structure and returns its reference
/// @param name
var sk_struct = array_create(SK_CONSTRAINT_HIERARCHY.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_constraint_hierarchy,argument0,
	"sk_constraint_hierarchy_setToSetupMix", // setup script
	"sk_constraint_hierarchy_apply", // apply script
	"sk_constraint_destroy_hierarchy" // destruction script
);
// create dynamic data structures
sk_struct[@ SK_CONSTRAINT_HIERARCHY.boneParentTuples] = ds_map_create(); // create a map for storing hierarchy states
// set default property values
sk_constraint_hierarchy_set_displayKey(sk_struct,undefined);
// apply transforms
sk_constraint_hierarchy_setToSetupMix(sk_struct);
// return to caller
return sk_struct;