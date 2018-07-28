/// @desc constructor
/// @param struct
argument0[@ SK_ARMATURE.bones] = ds_list_create();
argument0[@ SK_ARMATURE.slots] = ds_list_create();
argument0[@ SK_ARMATURE.skins] = ds_list_create();
argument0[@ SK_ARMATURE.constraints] = ds_list_create();
argument0[@ SK_ARMATURE.animations] = ds_list_create();
argument0[@ SK_ARMATURE.events] = ds_list_create();
argument0[@ SK_ARMATURE.attachments] = ds_list_create();
argument0[@ SK_ARMATURE.updateOrderDefault] = ds_list_create();
argument0[@ SK_ARMATURE.updateOrder] = ds_list_create();
argument0[@ SK_ARMATURE.drawOrderDefault] = ds_list_create();
argument0[@ SK_ARMATURE.drawOrder] = ds_list_create();
sk_armature_add(argument0,sk_skin_create("default"));