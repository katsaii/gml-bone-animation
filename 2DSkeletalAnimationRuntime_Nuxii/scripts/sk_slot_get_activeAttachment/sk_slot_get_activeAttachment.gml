/// @desc returns the final attachment state of the slot
///		| Calling this function will update the world transform of the point attachment if it exists, before returning it.
///		| This is because polling for point attachments when none exist is wasteful.
/// @param slot
var sk_attachment = argument0[SK_SLOT.attachmentFinal];
switch(sk_struct_get_type(sk_attachment)){
	case sk_type_attachment_point:
		var sk_bone = argument0[SK_SLOT.boneFinal];
		if(sk_struct_exists(sk_bone,sk_type_bone)){
			// update transform of point attachment
			sk_attachment_point_updateWorldTransform(sk_attachment,sk_bone);
		}
	break;
}
return sk_attachment;