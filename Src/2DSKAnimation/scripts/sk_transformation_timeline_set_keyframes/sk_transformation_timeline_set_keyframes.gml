__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_transformation_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_TRANSFORMATION_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_TRANSFORMATION_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_TIME]);
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE]) ? argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE] : 1;
	sk_keyframes[| sk_keyframe_id+SK_TRANSFORMATION_KEYFRAME_EASE] = is_real(argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_EASE]) ?  argument1[| sk_frame_id+SK_TRANSFORMATION_KEYFRAME_EASE] : 1;
}