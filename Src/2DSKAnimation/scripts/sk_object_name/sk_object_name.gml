/// @desc returns the name of the object returns undefined if it has no name
/// @param variable
var sk_obj_name = script_execute(sk_type_script_get_index(sk_object_type(argument0),"get_name",true),argument0);
return is_string(sk_obj_name) ? sk_obj_name : undefined;