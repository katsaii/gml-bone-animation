/// @desc applys the constraint
/// @param constraint
var sk_tuple = ds_map_find_value(argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples],argument0[SK_CONSTRAINT_HIERARCHY.tupleKeyFinal]);
if(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list)){
	var sk_tuple_last = ds_list_size(sk_tuple);
	var sk_tuple_id;
	for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_boneParent_ENTRIES){
		var sk_tuple_bone = sk_tuple[| sk_tuple_id+sk_tuple_boneParent_bone];
		var sk_tuple_parent_id = sk_tuple[| sk_tuple_id+sk_tuple_boneParent_parent];
		if(sk_tuple_parent_id < sk_tuple_id){
			// valid parent
			var sk_tuple_parent = sk_tuple[| sk_tuple_parent_id+sk_tuple_boneParent_bone];
			if(sk_struct_exists(sk_tuple_bone,sk_type_bone)&&sk_struct_exists(sk_tuple_parent,sk_type_bone)){
				// update child world transform
				if(sk_tuple_bone[SK_BONE.badApplied]){
					sk_bone_updateAppliedTransform(sk_tuple_bone);
				}
				sk_bone_updateWorldTransform_other(sk_tuple_bone,sk_tuple_parent);
			}
		}
	}
}