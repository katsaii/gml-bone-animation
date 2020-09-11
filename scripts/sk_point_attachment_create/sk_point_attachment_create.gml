/// @desc creates a new object and returns its reference
/// @param name
/// @param [x
/// @param y
/// @param rotation]
var sk_obj = sk_object_create(SK_TYPE_POINT_ATTACHMENT,SK_INTERFACE_ATTACHMENT);
sk_point_attachment_set_name(sk_obj,argument[0]);
if(argument_count>3) then sk_point_attachment_set_offsets(sk_obj,argument[1],argument[2],argument[3]);
return sk_obj;