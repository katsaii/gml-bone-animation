#macro sk_type_armature sk_armature_create
#macro sk_armature_var_bones 0
#macro sk_armature_var_slots 1
#macro sk_armature_var_skins 2
#macro sk_armature_var_constraints 3
#macro sk_armature_var_animations 4
#macro sk_armature_var_events 5
#macro sk_armature_var_attachments 6
#macro sk_armature_var_updateOrder 7
#macro sk_armature_var_drawOrder 8
#macro sk_armature_var_drawOrderFinal 9
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_updatable(sk_type_armature,argument0,"sk_armature_destroy","sk_armature_setToSetupPose","sk_armature_updateWorldTransform",-1);
sk_obj[@ sk_armature_var_bones] = ds_list_create();
sk_obj[@ sk_armature_var_slots] = ds_list_create();
sk_obj[@ sk_armature_var_skins] = ds_list_create();
sk_obj[@ sk_armature_var_constraints] = ds_list_create();
sk_obj[@ sk_armature_var_animations] = ds_list_create();
sk_obj[@ sk_armature_var_events] = ds_list_create();
sk_obj[@ sk_armature_var_attachments] = ds_list_create();
sk_obj[@ sk_armature_var_updateOrder] = ds_list_create();
sk_obj[@ sk_armature_var_drawOrder] = ds_list_create();
sk_obj[@ sk_armature_var_drawOrderFinal] = ds_list_create();
//sk_armature_add_skin(sk_obj,sk_skin_create("default"));
return sk_obj;