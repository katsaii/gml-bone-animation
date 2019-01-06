/// @desc dispose
/// @param variable
var sk_list_bones = argument0[sk_armature.bones];
var sk_list_slots = argument0[sk_armature.slots];
var sk_list_skins = argument0[sk_armature.skins];
var sk_list_constraints = argument0[sk_armature.constraints];
var sk_list_animations = argument0[sk_armature.animations];
var sk_list_events = argument0[sk_armature.events];
var sk_list_attachments = argument0[sk_armature.attachments];
var sk_list_updateOrder = argument0[sk_armature.skins];
var sk_list_drawOrder = argument0[sk_armature.drawOrder];
var sk_lists = [
	sk_list_bones,
	sk_list_slots,
	sk_list_skins,
	sk_list_constraints,
	sk_list_animations,
	sk_list_events,
	sk_list_attachments
];
for(var sk_list_id = 0, sk_list_count = array_length_1d(sk_lists); sk_list_id<sk_list_count; sk_list_id++){
	var sk_list = sk_lists[sk_list_id];
	for(var sk_item_id = 0, sk_item_count = ds_list_size(sk_list); sk_item_id<sk_item_count; sk_item_id++){
		var sk_item = sk_list[| sk_item_id];
		if(sk_list==sk_list_bones){
			sk_bone_destroy(sk_item);
		}else if(sk_list==sk_list_slots){
			sk_renderable_destroy(sk_item);
		}else if(sk_list==sk_list_constraints){
			sk_updatable_destroy(sk_item);
		}else if(sk_list==sk_list_skins){
			sk_skin_destroy(sk_item);
		}else if(sk_list==sk_list_animations){
			//sk_animation_destroy(sk_item);
		}else if(sk_list==sk_list_events){
			//sk_event_destroy(sk_item);
		}else if(sk_list==sk_list_attachments){
			sk_attachment_destroy(sk_item);
		}
	}
	ds_list_destroy(sk_list);
}
ds_list_destroy(sk_list_updateOrder);
ds_list_destroy(sk_list_drawOrder);