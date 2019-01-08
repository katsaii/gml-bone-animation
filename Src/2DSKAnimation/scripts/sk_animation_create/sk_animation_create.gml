/// @desc create
/// @param name
/// @param [duration
/// @param loop]
var sk_obj = sk_object_create(SK_TYPE_ATLAS);
sk_animation_set_name(sk_obj,argument[0]);
if(argument_count>2) then sk_animation_set_duration(sk_obj,argument[1],argument[2]);
return sk_obj;