#macro sk_type_bone sk_bone_create
#macro sk_bone_var_parent 0
#macro sk_bone_var_length 1
#macro sk_bone_var_setupTransform 2 /* [x,y,xscale,yscale,xshear,yshear,rotation,transformMode] */
#macro sk_bone_var_appliedTransform 3
#macro sk_bone_var_x 4
#macro sk_bone_var_y 5
#macro sk_bone_var_m00 6
#macro sk_bone_var_m01 7
#macro sk_bone_var_m10 8
#macro sk_bone_var_m11 9
#macro sk_bone_var_invalidAppliedTransform 10
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_updatable(sk_type_bone,argument0,-1,"sk_bone_setToSetupPose","sk_bone_updateWorldTransform","sk_bone_cache");
sk_bone_set_parent(sk_obj,noone);
sk_bone_set_length(sk_obj,100);
sk_bone_set_setupPose(sk_obj,0,0,1,1,0,0,0,sk_transformMode_normal);
sk_bone_setToSetupPose(sk_obj);
sk_bone_updateWorldTransform(sk_obj);
return sk_obj;