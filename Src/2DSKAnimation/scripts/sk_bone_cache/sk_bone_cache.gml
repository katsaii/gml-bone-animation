SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc sort bones in hierarchy
/// @param bone
/// @param id
var sk_bone_id = ds_list_find_index(argument1,argument0);
if(sk_bone_id==-1){
	// sort parent
	var sk_parent = argument0[sk_data_bone.parent];
	if(sk_parent!=undefined){
		sk_bone_cache(sk_parent,argument1);
	}
	// add self
	ds_list_add(argument1,argument0);
}