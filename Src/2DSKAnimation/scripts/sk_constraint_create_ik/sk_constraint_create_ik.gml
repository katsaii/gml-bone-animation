#macro sk_type_constraint_ik sk_constraint_create_ik
#macro sk_constraint_ik_var_chain 0
#macro sk_constraint_ik_var_joint 1
#macro sk_constraint_ik_var_effector 2
#macro sk_constraint_ik_var_defaultBendDir 3
#macro sk_constraint_ik_var_defaultWeight 4
#macro sk_constraint_ik_var_bendDir 5
#macro sk_constraint_ik_var_weight 6
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_updatable(sk_type_constraint_ik,argument0,-1,"sk_constraint_ik_setToSetupMix","sk_constraint_ik_apply","sk_constraint_ik_cache");
sk_constraint_ik_set_bones(sk_obj,noone,noone,true);
sk_constraint_ik_set_setupMix(sk_obj,sk_bendDir_negative,1);
sk_constraint_ik_setToSetupMix(sk_obj);
return sk_obj;