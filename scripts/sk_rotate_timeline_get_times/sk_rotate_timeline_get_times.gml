__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_rotate_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_rotate_timeline.keyframes];
ds_list_clear(argument1);
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_ROTATE_KEYFRAME_ENTRIES;
for(var sk_keyframe_id = 0; sk_keyframe_id<=sk_keyframe_last; sk_keyframe_id += SK_ROTATE_KEYFRAME_ENTRIES){
	ds_list_add(argument1,sk_keyframes[| sk_keyframe_id+SK_ROTATE_KEYFRAME_TIME]);
}