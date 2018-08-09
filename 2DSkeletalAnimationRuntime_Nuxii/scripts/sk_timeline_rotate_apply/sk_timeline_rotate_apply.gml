/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param body
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_body = argument1; if(!SK_CONFIG_RELEASE_MODE&&!sk_struct_exists(sk_body,sk_type_bone)){ return; }
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+sk_keyframe_rotate.tweenEasing]);
var sk_r = sk_keyframes[| sk_keyframe_prev+sk_keyframe_rotate.rotation];
sk_r += sk_interpolation*(
	-angle_difference(sk_r,sk_keyframes[| sk_keyframe_next+sk_keyframe_rotate.rotation])
	+360*sk_keyframes[| sk_keyframe_prev+sk_keyframe_rotate.cycles]
);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		var sk_rotation = sk_body[SK_BONE.rotationApplied];
		sk_body[@ SK_BONE.rotationApplied] = sk_rotation-angle_difference(sk_rotation,sk_body[SK_BONE.rotation]+sk_r)*sk_alpha;
	break;
	case sk_mixPose_add: 
		sk_body[@ SK_BONE.rotationApplied] = sk_body[SK_BONE.rotationApplied]+sk_r*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_body[@ SK_BONE.rotation] = sk_body[SK_BONE.rotation]+sk_r*sk_alpha;
	break;
}