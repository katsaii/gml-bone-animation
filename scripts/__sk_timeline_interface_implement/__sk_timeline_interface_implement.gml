#macro SK_INTERFACE_TIMELINE "timeline"
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"get_times");
argument0[@ 1,1] = sk_type_script_get_index(sk_type,"apply");