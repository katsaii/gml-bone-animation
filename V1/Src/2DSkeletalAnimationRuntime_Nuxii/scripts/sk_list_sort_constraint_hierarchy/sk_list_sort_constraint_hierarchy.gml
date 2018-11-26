/// @desc sorts the parent bones in the map before the child so their transforms are ready to be inherited on demand
/// @param updateOrder
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_hierarchy)){
	var sk_availableTuples = argument1[SK_CONSTRAINT_HIERARCHY.boneParentTuples];
	var sk_count = ds_map_size(sk_availableTuples);
	var sk_key = ds_map_find_first(sk_availableTuples);
	repeat(sk_count){
		var sk_tuple = sk_availableTuples[? sk_key];
		if(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list)){
			var sk_tuple_last = ds_list_size(sk_tuple);
			var sk_tuple_id;
			for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_boneParent_ENTRIES){
				// sort all the bones in the current tuple
				sk_list_sort_bone(argument0,sk_tuple[| sk_tuple_id+sk_tuple_boneParent_bone]);
			}
		}
		// goto next tuple
		sk_key = ds_map_find_next(sk_availableTuples,sk_key);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}