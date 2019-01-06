enum sk_data_armature{
	bones,
	constraints,
	slots,
	animations,
	skins,
	attachments,
	events,
	updateOrder,
	drawOrder
}
/// @desc initialise
/// @param variable
argument0[@ sk_armature.bones] = ds_list_create();
argument0[@ sk_armature.constraints] = ds_list_create();
argument0[@ sk_armature.slots] = ds_list_create();
argument0[@ sk_armature.animations] = ds_list_create();
argument0[@ sk_armature.skins] = ds_list_create();
argument0[@ sk_armature.attachments] = ds_list_create();
argument0[@ sk_armature.events] = ds_list_create();
argument0[@ sk_armature.updateOrder] = ds_list_create();
argument0[@ sk_armature.drawOrder] = ds_list_create();
ds_list_add(argument0[sk_armature.skins],sk_skin_create("default"));