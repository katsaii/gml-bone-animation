/// @desc create
/// @param name
/// @param [anchor
/// @param target]
var sk_obj = sk_object_create(SK_TYPE_PHYSICS_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_physics_constraint_set_name(sk_obj,argument[0]);
if(argument_count>2) then sk_physics_constraint_set_bones(sk_obj,argument[1],argument[2]);
return sk_obj;