/// @desc create
/// @param [armature]
var sk_obj = sk_object_create(SK_TYPE_DRAW_ORDER_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_drawOrder_timeline_set_target_armature(sk_obj,argument[0]);
return sk_obj;