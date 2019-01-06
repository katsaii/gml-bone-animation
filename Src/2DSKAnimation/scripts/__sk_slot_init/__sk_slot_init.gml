#macro SK_TYPE_SLOT "slot"
enum sk_data_slot{
	name,
	apply,
	availableAttachments,
	defaultAttachmentKey,
	setupColour,setupAlpha,setupBone,setupAttachment,
	appliedColour,appliedAlpha,appliedBone,appliedAttachment,
}
/// @desc initialise
/// @param variable
sk_bone_set_name(argument0,undefined);
sk_bone_set_parent(argument0,undefined);
sk_bone_set_length(argument0,100);
sk_bone_set_pose(argument0,0,0,1,1,0,0,0,SK_TRANSFORM_MODE_NORMAL);
sk_bone_setup(argument0);
sk_bone_update(argument0);