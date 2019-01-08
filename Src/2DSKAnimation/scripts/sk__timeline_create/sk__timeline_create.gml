/// @desc create
/// @param [bone]
var sk_obj = sk_object_create(SK_TYPE__TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk__timeline_set_(sk_obj,argument[0]);
return sk_obj;