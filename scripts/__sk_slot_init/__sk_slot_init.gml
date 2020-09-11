#macro SK_TYPE_SLOT "slot"
enum sk_data_slot{
	name,
	apply,
	availableAttachments,
	setupAttachmentKey,
	setupColour,setupAlpha,setupBone,setupAttachment,
	appliedColour,appliedAlpha,appliedBone,appliedAttachment,
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_slot.availableAttachments] = ds_map_create();
sk_slot_set_name(argument0,undefined);
sk_slot_set_pose(argument0,c_white,1,undefined,undefined);
sk_slot_setup(argument0);