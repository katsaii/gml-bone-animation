#macro sk_type_slot sk_slot_create
#macro sk_slot_var_availableAttachments 0
#macro sk_slot_var_defaultAttachmentKey 1
#macro sk_slot_var_setupPose 2 /* [colour,alpha,bone,attachment] */
#macro sk_slot_var_finalPose 3
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_symbol(sk_type_slot,argument0,"sk_slot_destroy","sk_slot_setToSetupPose","sk_slot_apply");
sk_obj[@ sk_slot_var_availableAttachments] = ds_map_create();
sk_slot_set_defaultDisplay(sk_obj,undefined);
sk_slot_set_setupPose(sk_obj,0xffffff,1,noone,noone);
sk_slot_setToSetupPose(sk_obj);
return sk_obj;
