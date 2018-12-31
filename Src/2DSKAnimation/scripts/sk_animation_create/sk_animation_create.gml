#macro sk_type_animation sk_animation_create
#macro sk_animation_var_start 0
#macro sk_animation_var_duration 1
#macro sk_animation_var_looping 2
#macro sk_animation_var_timelines 3
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build(sk_type_animation,argument0,undefined);
sk_obj[@ sk_animation_var_timelines] = ds_list_create();
sk_animation_set_range(sk_obj,0,0,false);
return sk_obj;