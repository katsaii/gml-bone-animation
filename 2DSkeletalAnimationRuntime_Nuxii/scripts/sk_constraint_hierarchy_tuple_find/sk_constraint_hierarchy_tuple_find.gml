/// @desc adds a tupple to the list of available tuples and returns its index
/// @param constraint
/// @param id
var sk_availableTuples = argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples];
var sk_tuple = ds_list_find_value(sk_availableTuples,argument1);
if(!(is_real(sk_tuple)&&ds_exists(sk_tuple,ds_type_list))){
	sk_tuple = ds_list_create();
	sk_availableTuples[| argument1] = sk_tuple;
	ds_list_mark_as_list(sk_availableTuples,argument1);
}
return sk_tuple;