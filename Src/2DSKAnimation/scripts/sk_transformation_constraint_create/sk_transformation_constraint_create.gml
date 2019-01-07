/// @desc create
/// @param name
/// @param [joint
/// @param effector
/// @param chain]
var sk_obj = sk_object_create(SK_TYPE_IK_CONSTRAINT,SK_INTERFACE_UPDATABLE);
sk_ik_constraint_set_name(sk_obj,argument[0]);
if(argument_count>3) then sk_ik_constraint_set_bones(sk_obj,argument[1],argument[2],argument[3]);
return sk_obj;