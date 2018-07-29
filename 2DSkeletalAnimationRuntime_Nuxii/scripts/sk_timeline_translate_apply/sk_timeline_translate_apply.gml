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
var sk_body = argument1; if(!sk_struct_exists(sk_body,sk_type_bone)){ return; }
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+sk_keyframe_translate.tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_translate.dx],sk_keyframes[| sk_keyframe_next+sk_keyframe_translate.dx],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_translate.dy],sk_keyframes[| sk_keyframe_next+sk_keyframe_translate.dy],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		sk_body[@ SK_BONE.XApplied] = lerp(sk_body[SK_BONE.XApplied],sk_body[SK_BONE.X]+sk_x,sk_alpha);
		sk_body[@ SK_BONE.YApplied] = lerp(sk_body[SK_BONE.YApplied],sk_body[SK_BONE.Y]+sk_y,sk_alpha);
	break;
	case sk_mixPose_add:
		sk_body[@ SK_BONE.XApplied] = sk_body[SK_BONE.XApplied]+sk_x*sk_alpha;
		sk_body[@ SK_BONE.YApplied] = sk_body[SK_BONE.YApplied]+sk_y*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_body[@ SK_BONE.X] = sk_body[SK_BONE.X]+sk_x*sk_alpha;
		sk_body[@ SK_BONE.Y] = sk_body[SK_BONE.Y]+sk_y*sk_alpha;
	break;
}