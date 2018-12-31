#macro sk_type_animation sk_animation_create
#macro sk_animation_var_duration 0
#macro sk_animation_var_looping 1
#macro sk_animation_var_timelines 2
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build();
sk_obj[@ sk_animation_var_timelines] = ds_list_create();
sk_animation_set_duration(sk_obj,0);
sk_animation_set_looping(sk_obj,false);
return sk_obj;