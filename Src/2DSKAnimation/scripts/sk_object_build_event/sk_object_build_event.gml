#macro sk_class_event sk_object_build_event
#macro sk_event_var_call sk_object_var_args+0
/// @desc creates an event object
/// @param call
var sk_obj = sk_object_build();
sk_obj[@ sk_object_var_class] = sk_class_event;
sk_obj[@ sk_event_var_call] = sk_obtain_script(argument0);
return sk_obj;