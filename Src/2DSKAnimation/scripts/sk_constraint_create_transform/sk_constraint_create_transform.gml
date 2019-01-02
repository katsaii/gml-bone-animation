#macro sk_type_constraint_transform sk_constraint_create_transform
#macro sk_constraint_transform_var_local 0 
#macro sk_constraint_transform_var_relative 1
#macro sk_constraint_transform_var_children 2
#macro sk_constraint_transform_var_target 3
#macro sk_constraint_transform_var_x 4
#macro sk_constraint_transform_var_y 5
#macro sk_constraint_transform_var_xscale 6
#macro sk_constraint_transform_var_yscale 7
#macro sk_constraint_transform_var_yshear 8
#macro sk_constraint_transform_var_rotation 9
#macro sk_constraint_transform_var_setupTransform 10
#macro sk_constraint_transform_var_appliedTransform 11
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_updatable(sk_type_constraint_transform,argument0,"sk_constraint_destroy_transform","sk_constraint_transform_setToSetupMix","sk_constraint_transform_apply","sk_constraint_transform_cache");
sk_obj[@ sk_constraint_transform_var_children] = ds_list_create();
sk_obj[@ sk_constraint_transform_var_setupTransform] = [undefined];
sk_obj[@ sk_constraint_transform_var_appliedTransform] = [undefined];
sk_constraint_transform_set_state(sk_obj,false,false);
sk_constraint_transform_set_target(sk_obj,noone);
sk_constraint_transform_set_offset(sk_obj,0,0,0,0,0,0);
sk_constraint_transform_set_setupMix(sk_obj,1,1,1,1);
sk_constraint_transform_setToSetupMix(sk_obj);
return sk_obj;