/// @desc create
/// @param name
/// @param [parent]
/// @param [length]
var sk_obj = sk_object_create(SK_TYPE_BONE,SK_INTERFACE_UPDATABLE);
sk_bone_set_name(sk_obj,argument[0]);
if(argument_count>1) then sk_bone_set_parent(sk_obj,argument[1]);
if(argument_count>2) then sk_bone_set_length(sk_obj,argument[2]);
return sk_obj;