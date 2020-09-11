/// @desc create
/// @param name
var sk_obj = sk_object_create(SK_TYPE_SLOT,SK_INTERFACE_RENDERABLE);
sk_slot_set_name(sk_obj,argument[0]);
return sk_obj;