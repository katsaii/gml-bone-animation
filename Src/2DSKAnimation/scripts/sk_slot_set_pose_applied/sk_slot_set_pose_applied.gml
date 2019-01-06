__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_slot_exists(argument0);
/// @desc sets a property
/// @param slot
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment_or_key
argument0[@ sk_data_slot.appliedColour] = real(argument1);
argument0[@ sk_data_slot.appliedAlpha] = real(argument2);
argument0[@ sk_data_slot.appliedBone] = sk_bone_exists(argument3) ? argument3 : undefined;
argument0[@ sk_data_slot.appliedAttachment] = ds_map_find_value(argument0[sk_data_slot.availableAttachments],sk_attachment_exists(argument4) ? sk_slot_attachment_get_key(argument0,argument4) : argument4);