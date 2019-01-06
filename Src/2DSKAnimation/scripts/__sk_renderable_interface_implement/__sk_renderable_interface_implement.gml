#macro SK_INTERFACE_RENDERABLE "renderable"
/// @desc initialise
/// @param variable
var sk_type = sk_object_type(argument0);
argument0[@ 1,0] = sk_type_script_get_index(sk_type,"setup");
argument0[@ 1,1] = sk_type_script_get_index(sk_type,"vertex_apply");
argument0[@ 1,2] = sk_type_script_get_index(sk_type,"get_attachments");
argument0[@ 1,3] = sk_type_script_get_index(sk_type,"set_attachments");