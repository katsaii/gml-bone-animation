/// @desc create
/// @param name
/// @param [target]
var sk_obj = sk_object_create(SK_TYPE_TRANSFORMATION_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_ik_constraint_set_name(sk_obj,argument[0]);
if(argument_count>1) then sk_transformation_constraint_set_target(sk_obj,argument[1]);
return sk_obj;