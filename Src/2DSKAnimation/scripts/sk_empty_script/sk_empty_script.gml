/// @desc an empty script which is called if no script was found
/// @param object
/// @param [args...]
show_debug_message("Object script not found for skeleton object ["+string(sk_object_exists(argument0) ? argument0[sk_obj_type] : undefined)+"]");