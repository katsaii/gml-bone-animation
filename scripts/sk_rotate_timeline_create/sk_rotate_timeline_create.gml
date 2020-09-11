/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE_ROTATE_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_rotate_timeline_set_bone(sk_obj,argument[0]);
return sk_obj;