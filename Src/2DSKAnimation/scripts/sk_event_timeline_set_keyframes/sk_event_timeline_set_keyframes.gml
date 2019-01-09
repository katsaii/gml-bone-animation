__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_EVENT_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_EVENT_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_EVENT_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_BONE] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_BONE];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_STRING] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_STRING];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_REAL] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_REAL];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_INT] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_INT];
	sk_keyframes[| sk_keyframe_id+SK_EVENT_KEYFRAME_DATA_SOUND] = argument1[| sk_frame_id+SK_EVENT_KEYFRAME_DATA_SOUND];
}