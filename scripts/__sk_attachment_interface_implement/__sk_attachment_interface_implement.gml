#macro SK_INTERFACE_ATTACHMENT "attachment"
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"vertex_add");