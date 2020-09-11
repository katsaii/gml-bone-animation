/// @desc shifts data in an update cache using the supplied tuple
/// @param id
/// @param tuple
var tuple = argument1;
var tuple_last = ds_list_size(tuple);
var tuple_id;
for(tuple_id = 0; tuple_id<tuple_last; tuple_id += 2){
	var tuple_value = tuple[| tuple_id+0];
	var tuple_shift = tuple[| tuple_id+1];
	var tuple_value_index = ds_list_find_index(argument0,tuple_value);
	if(tuple_value_index!=-1){
		// shift value
		__sk_shift_value(argument0,tuple_value_index,tuple_shift);
	}
}