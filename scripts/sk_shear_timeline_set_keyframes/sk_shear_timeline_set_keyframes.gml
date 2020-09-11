__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_shear_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_shear_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_SHEAR_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_SHEAR_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_X] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_X]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_Y] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_Y]);
	sk_keyframes[| sk_keyframe_id+SK_SHEAR_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_SHEAR_KEYFRAME_EASE]);
}