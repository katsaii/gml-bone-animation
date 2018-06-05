/// @desc applys transformations between a set of bones and a universal parent bone
/// @param constraint
var sk_boneTarget = argument0[SK_CONSTRAINT_TRANSFORM.boneTarget];
var sk_bones = argument0[SK_CONSTRAINT_TRANSFORM.boneChildren];
var sk_boneCount = ds_list_size(sk_bones);
if((!sk_struct_exists(sk_boneTarget,sk_type_bone))||(sk_boneCount<1)){
	return;
}
var sk_xoffset = argument0[SK_CONSTRAINT_TRANSFORM.X];
var sk_yoffset = argument0[SK_CONSTRAINT_TRANSFORM.Y];
var sk_xscaleoffset = argument0[SK_CONSTRAINT_TRANSFORM.XScale];
var sk_yscaleoffset = argument0[SK_CONSTRAINT_TRANSFORM.YScale];
var sk_yshearoffset = argument0[SK_CONSTRAINT_TRANSFORM.YShear];
var sk_rotationoffset = argument0[SK_CONSTRAINT_TRANSFORM.rotation];
var sk_translateMix = argument0[SK_CONSTRAINT_TRANSFORM.translateMixFinal];
var sk_scaleMix = argument0[SK_CONSTRAINT_TRANSFORM.scaleMixFinal];
var sk_shearMix = argument0[SK_CONSTRAINT_TRANSFORM.shearMixFinal];
var sk_rotateMix = argument0[SK_CONSTRAINT_TRANSFORM.rotateMixFinal];
switch(((argument0[SK_CONSTRAINT_TRANSFORM.local]||false)<<0)|((argument0[SK_CONSTRAINT_TRANSFORM.relative]||false)<<1)){
	case 0: // not local; not relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			if(sk_struct_exists(sk_bone,sk_type_bone)){
				sk_transformation_apply_absoluteWorld(
					sk_bone,sk_boneTarget,
					sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
					sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
				);
			}
		}
	break;
	case 1: // local; not relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			if(sk_struct_exists(sk_bone,sk_type_bone)){
				sk_transformation_apply_absoluteLocal(
					sk_bone,sk_boneTarget,
					sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
					sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
				);
			}
		}
	break;
	case 2: // not local; relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			if(sk_struct_exists(sk_bone,sk_type_bone)){
				sk_transformation_apply_relativeWorld(
					sk_bone,sk_boneTarget,
					sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
					sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
				);
			}
		}
	break;
	case 3: // local; relative
		var sk_bone_id;
		for(sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			var sk_bone = sk_bones[| sk_bone_id];
			if(sk_struct_exists(sk_bone,sk_type_bone)){
				sk_transformation_apply_relativeLocal(
					sk_bone,sk_boneTarget,
					sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
					sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
				);
			}
		}
	break;
}