/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_create(SK_TYPE_PLANE_ATTACHMENT,SK_INTERFACE_ATTACHMENT);
sk_plane_attachment_set_name(sk_obj,argument[0]);
return sk_obj;