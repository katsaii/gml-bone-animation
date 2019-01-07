__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param id
var sk_children = argument0[sk_data_transformation_constraint.children];
ds_list_clear(sk_children);
var sk_child_count = ds_list_size(argument1);
for(var sk_child_id = 0; sk_child_id<sk_child_count; sk_child_id++){
	var sk_child = argument1[| sk_child_id];
	if(sk_bone_exists(sk_child)){
		ds_list_add(sk_children,sk_child);
	}
}