/// @desc create
/// @param name
/// @param [bone
/// @param string
/// @param real
/// @param int
/// @param sound]
var sk_obj = sk_object_create(SK_TYPE_EVENT);
sk_event_set_name(sk_obj,argument[0]);
if(argument_count>5) then sk_event_set_data(sk_obj,argument[1],argument[2],argument[3],argument[4],argument[5]);
return sk_obj;