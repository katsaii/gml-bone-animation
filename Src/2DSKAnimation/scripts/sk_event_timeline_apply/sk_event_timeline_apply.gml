__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_event_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
if(sk_alpha>=0.5){
	// interpolate
	if(sk_events!=undefined){
		if(sk_keyframePrevious_id!=sk_keyframeA_id){
			var sk_bone = sk_keyframes[| sk_keyframeA_id+SK_EVENT_KEYFRAME_DATA_BONE];
			var sk_string = sk_keyframes[| sk_keyframeA_id+SK_EVENT_KEYFRAME_DATA_STRING];
			var sk_real = sk_keyframes[| sk_keyframeA_id+SK_EVENT_KEYFRAME_DATA_REAL];
			var sk_int = sk_keyframes[| sk_keyframeA_id+SK_EVENT_KEYFRAME_DATA_INT];
			var sk_sound = sk_keyframes[| sk_keyframeA_id+SK_EVENT_KEYFRAME_DATA_SOUND];
			// apply
			switch(sk_mixPose){
				case SK_MIX_BLEND: case SK_MIX_ADD:
					sk_event_set_data_applied(sk_target,sk_bone,sk_string,sk_real,sk_int,sk_sound);
				break;
				case SK_MIX_OVERWRITE:
					sk_event_set_data(sk_target,sk_bone,sk_string,sk_real,sk_int,sk_sound);
				break;
			}
			ds_list_add(sk_events,sk_target);
		}
	}
}