#macro sk_type_constraint_hierarchy "ofHierarchyConstraint"
enum SK_CONSTRAINT_HIERARCHY{
	boneChild,availableParents,defaultParentKey,
	boneParent,
	boneParentFinal,
	sizeof
}
gml_pragma("global",@"
	sk_struct_type_add(sk_type_constraint_hierarchy,SK_CONSTRAINT_HIERARCHY.sizeof,sk_construct_constraint_hierarchy,sk_destruct_constraint_hierarchy);
");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_hierarchy,argument0);
return sk_structure;