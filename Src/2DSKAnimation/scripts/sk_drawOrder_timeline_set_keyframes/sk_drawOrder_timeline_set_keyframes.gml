__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
gml_pragma("forceinline");
/// @desc returns a property
/// @param timeline
/// @param id
var sk_keyframes = argument0[sk_data_drawOrder_timeline.keyframes];
ds_list_clear(sk_keyframes);
var sk_frame_last = ds_list_size(argument1)-SK_DRAW_ORDER_KEYFRAME_ENTRIES;
for(var sk_frame_id = 0; sk_frame_id<=sk_frame_last; sk_frame_id += SK_DRAW_ORDER_KEYFRAME_ENTRIES){
	var sk_keyframe_id = ds_list_size(sk_keyframes);
	sk_keyframes[| sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TIME] = real(argument1[| sk_frame_id+SK_DRAW_ORDER_KEYFRAME_TIME]);
	var sk_tuple = argument1[| sk_frame_id+SK_DRAW_ORDER_KEYFRAME_TUPLE];
	if(is_real(sk_tuple)){
		var sk_target = ds_list_create();
		sk_keyframes[| sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TUPLE] = sk_target;
		ds_list_mark_as_list(sk_keyframes,sk_keyframe_id+SK_DRAW_ORDER_KEYFRAME_TUPLE);
		var sk_tuple_last = ds_list_size(sk_tuple)-2;
		for(var sk_tuple_id = 0; sk_tuple_id<=sk_tuple_last; sk_tuple_id++){
			var sk_tuple_slot = sk_tuple[| sk_tuple_id+0];
			var sk_tuple_offset = sk_tuple[| sk_tuple_id+1];
			if(sk_slot_exists(sk_tuple_slot)){
				ds_list_add(
					sk_target,
					sk_tuple_slot,
					real(sk_tuple_offset)
				);
			}
		}
	}
}