/// @desc appends a slot to an update cache
/// @param updateCache
/// @param slotOrSymbol
if(sk_struct_type_exists(sk_struct_get_type(argument1))){
	ds_list_add(argument0,argument1);
}