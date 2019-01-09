__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_timeline_exists(argument0);
if(false) then var sk_ignoreTheseArguments = [argument3];
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
/// @param mixDirection
var sk_target = argument0[sk_data_event_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_EVENT_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_event_timeline.keyframes];
if(argument5>=0.5){
	// interpolate
	var sk_events = argument6;
	var sk_direction = argument7;
	if((sk_events!=undefined)&&(sk_direction!=0)){
		var sk_keyframe = (sk_direction>0) ? sk_keyframeA_id : sk_keyframeB_id;
		var sk_bone = sk_keyframes[| sk_keyframe+SK_EVENT_KEYFRAME_DATA_BONE];
		var sk_string = sk_keyframes[| sk_keyframe+SK_EVENT_KEYFRAME_DATA_STRING];
		var sk_real = sk_keyframes[| sk_keyframe+SK_EVENT_KEYFRAME_DATA_REAL];
		var sk_int = sk_keyframes[| sk_keyframe+SK_EVENT_KEYFRAME_DATA_INT];
		var sk_sound = sk_keyframes[| sk_keyframe+SK_EVENT_KEYFRAME_DATA_SOUND];
		// apply
		switch(argument4){
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