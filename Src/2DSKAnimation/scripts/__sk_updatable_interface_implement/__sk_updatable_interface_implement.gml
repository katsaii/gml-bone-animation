#macro SK_INTERFACE_UPDATABLE "updatable"
/// @desc initialise
/// @param variable
var sk_type_path = "sk_"+string(sk_object_type(argument0))+"_";
argument0[@ 1,0] = __sk_script_get_index(sk_type_path+"setup");
argument0[@ 1,1] = __sk_script_get_index(sk_type_path+"update");
argument0[@ 1,2] = __sk_script_get_index(sk_type_path+"cache");