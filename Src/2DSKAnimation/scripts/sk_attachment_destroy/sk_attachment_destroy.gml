gml_pragma("forceinline");
/// @desc destroys the attachment
/// @param attachment
script_execute(argument0[sk_attachment_var_destructor],argument0);
sk_object_wipe(argument0);