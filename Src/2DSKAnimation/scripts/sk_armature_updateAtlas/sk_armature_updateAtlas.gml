/// @desc iterates through the attachments and updates their regions using the supplied atlas
/// @param armature
/// @param atlas
var sk_attachments = argument0[sk_armature_var_attachments];
var sk_attachment_count = ds_list_size(sk_attachments);
for(var sk_attachment_id = 0; sk_attachment_id<sk_attachment_count; sk_attachment_id++){
	var sk_attachment = sk_attachments[| sk_attachment_id];
	if(sk_object_oftype(sk_attachment,sk_type_attachment_plane)){
		sk_attachment_plane_updateRegionData(sk_attachment,argument1);
	}
}