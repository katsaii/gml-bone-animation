/// @desc an empty script which is called if no script was found, but asserts a message that something is wrong
/// @param object
/// @param [args...]
show_debug_message("Object script not found for skeleton object ["+string(sk_object_exists(argument0) ? sk_object_type(argument0) : undefined)+"]");