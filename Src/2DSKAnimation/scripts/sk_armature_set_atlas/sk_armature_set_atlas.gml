__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc iterates through the attachments and updates their regions using the supplied atlas
/// @param armature
/// @param atlas
var sk_attachments = argument0[sk_data_armature.attachments];
var sk_attachment_count = ds_list_size(sk_attachments);
for(var sk_attachment_id = 0; sk_attachment_id<sk_attachment_count; sk_attachment_id++){
	var sk_attachment = sk_attachments[| sk_attachment_id];
	if(sk_plane_attachment_exists(sk_attachment)){
		sk_plane_attachment_set_atlas(sk_attachment,argument1);
	}
}