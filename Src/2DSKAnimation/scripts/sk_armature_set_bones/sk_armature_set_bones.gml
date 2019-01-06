__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc sets a property
/// @param armature
/// @param id
var sk_target_list = argument0[sk_data_armature.bones];
var sk_item_count = ds_list_size(argument1);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = argument1[| sk_item_id];
	if(sk_bone_exists(sk_item)){
		ds_list_add(sk_target_list,sk_item);
	}
}