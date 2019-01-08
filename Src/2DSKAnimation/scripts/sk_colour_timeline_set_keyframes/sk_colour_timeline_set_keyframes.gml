__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_colour_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_colour_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_COLOUR_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_COLOUR_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_COLOUR] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_COLOUR]);
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_ALPHA] = is_real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_ALPHA]) ? argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_ALPHA] : 1;
	sk_keyframes[| sk_keyframe_id+SK_COLOUR_KEYFRAME_EASE] = real(argument1[| sk_frame_id+SK_COLOUR_KEYFRAME_EASE]);
}