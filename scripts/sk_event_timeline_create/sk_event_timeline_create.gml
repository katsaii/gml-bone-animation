/// @desc create
/// @param [event]
var sk_obj = sk_object_create(SK_TYPE_EVENT_TIMELINE,SK_INTERFACE_TIMELINE);
if(argument_count>0) then sk_event_timeline_set_event(sk_obj,argument[0]);
return sk_obj;