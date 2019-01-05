/// @desc returns the name of the object returns undefined if it has no name
/// @param variable
var sk_obj_name = script_execute(__sk_script_get_index("sk_"+string(sk_object_type(argument0))+"_get_name"),argument0);
return is_string(sk_obj_name) ? sk_obj_name : undefined;