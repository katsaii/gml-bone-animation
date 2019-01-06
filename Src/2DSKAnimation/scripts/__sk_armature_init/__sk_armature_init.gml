#macro SK_TYPE_ARMATURE "armature"
enum sk_data_armature{
	bones,
	constraints,
	slots,
	animations,
	skins,defaultSkin,
	attachments,
	events,
	updateOrder,
	drawOrder
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_armature.bones] = ds_list_create();
argument0[@ sk_data_armature.constraints] = ds_list_create();
argument0[@ sk_data_armature.slots] = ds_list_create();
argument0[@ sk_data_armature.animations] = ds_list_create();
argument0[@ sk_data_armature.skins] = ds_list_create();
argument0[@ sk_data_armature.attachments] = ds_list_create();
argument0[@ sk_data_armature.events] = ds_list_create();
argument0[@ sk_data_armature.updateOrder] = ds_list_create();
argument0[@ sk_data_armature.drawOrder] = ds_list_create();