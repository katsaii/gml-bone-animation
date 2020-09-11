/// @desc create
/// @param [armature]
var sk_obj = sk_object_create(SK_TYPE_ANIMATION_STATE);
if(argument_count>0) then sk_animationState_set_animations_armature(sk_obj,argument[0]);
return sk_obj;