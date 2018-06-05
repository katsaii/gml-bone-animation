#macro sk_tuple_item 0
#macro sk_tuple_offset 1
#macro sk_tuple_ENTRIES 2
/// @desc shifts data in an update cache using the supplied tuple
/// @param updateCache
/// @param itemOffsetTuple
var sk_tuple = argument1;
var sk_tuple_last = ds_list_size(sk_tuple);
var sk_tuple_id;
for(sk_tuple_id = 0; sk_tuple_id < sk_tuple_last; sk_tuple_id+=sk_tuple_ENTRIES){
	var sk_tuple_value = sk_tuple[| sk_tuple_id+sk_tuple_item];
	var sk_tuple_shift = sk_tuple[| sk_tuple_id+sk_tuple_offset];
	var sk_tuple_value_index = ds_list_find_index(argument0,sk_tuple_value);
	if(sk_tuple_value_index!=-1){
		if(is_real(sk_tuple_shift)){
			// shift value
			sk_list_shift(argument0,sk_tuple_value_index,sk_tuple_shift);
		} else {
			// delete value
			ds_list_delete(argument0,sk_tuple_value_index);
		}
	}
}