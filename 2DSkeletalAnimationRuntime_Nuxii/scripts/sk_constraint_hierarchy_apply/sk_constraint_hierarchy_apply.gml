/// @desc applys the constraint
/// @param constraint
var sk_child = argument0[SK_CONSTRAINT_HIERARCHY.boneChild];
var sk_parent = argument0[SK_CONSTRAINT_HIERARCHY.boneParentFinal];
if(sk_struct_exists(sk_child,sk_type_bone)&&sk_struct_exists(sk_parent,sk_type_bone)){
	if(sk_child[SK_BONE.badApplied]){
		sk_bone_updateAppliedTransform(sk_child);
	}
	sk_bone_updateWorldTransform_other(sk_child,sk_parent);
}