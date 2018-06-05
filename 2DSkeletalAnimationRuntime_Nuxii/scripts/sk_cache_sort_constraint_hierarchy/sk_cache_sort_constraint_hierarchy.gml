/// @desc sorts the parent bones in the map before the child so their transforms are ready to be inherited on demand
/// @param updateOrder
/// @param constraint
if(sk_struct_exists(argument1,sk_type_constraint_hierarchy)){
	var sk_bone_child = argument1[SK_CONSTRAINT_HIERARCHY.boneChild];
	var sk_bones = argument1[SK_CONSTRAINT_HIERARCHY.availableParents];
	if(sk_struct_exists(sk_bone_child,sk_type_bone)){
		// sort parent bones
		var sk_bone_count = ds_map_size(sk_bones);
		var sk_bone_key = ds_map_find_first(sk_bones);
		repeat(sk_bone_count){
			var sk_bone_parent = sk_bones[? sk_bone_key];
			if(sk_struct_exists(sk_bone_parent,sk_type_bone)){
				sk_cache_sort_bone(argument0,sk_bone_parent);
			}
			// goto next child
			sk_bone_key = ds_map_find_next(sk_bones,sk_bone_key);
		}
		// sort child
		sk_cache_sort_bone(argument0,sk_bone_child);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}