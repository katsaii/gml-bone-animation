#macro sk_type_constraint_hierarchy "ofHierarchyConstraint"
enum SK_CONSTRAINT_HIERARCHY{
	boneParentTuples, /* a list of 2 record tuple consisting of a bone and the id of its parent */
	tupleKey,
	tupleKeyFinal,
	sizeof
}
#macro sk_tuple_boneParent_bone 0
#macro sk_tuple_boneParent_parent 1
#macro sk_tuple_boneParent_ENTRIES 2
gml_pragma("global","sk_struct_type_add(sk_type_constraint_hierarchy,SK_CONSTRAINT_HIERARCHY.sizeof,sk_construct_constraint_hierarchy,sk_destruct_constraint_hierarchy);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_hierarchy,argument0);
sk_constraint_hierarchy_set_setupMix(sk_structure,-1);
sk_constraint_hierarchy_setToSetupMix(sk_structure);
return sk_structure;