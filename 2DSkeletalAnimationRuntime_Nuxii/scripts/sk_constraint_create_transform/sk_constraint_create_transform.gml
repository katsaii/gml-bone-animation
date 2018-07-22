#macro sk_type_constraint_transform "ofTransformationConstraint"
enum SK_CONSTRAINT_TRANSFORM{
	local,relative,boneChildren,boneTarget,
	X,Y,XScale,YScale,YShear,rotation,
	translateMix,scaleMix,shearMix,rotateMix,
	translateMixFinal,scaleMixFinal,shearMixFinal,rotateMixFinal,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_constraint_transform,SK_CONSTRAINT_TRANSFORM.sizeof,sk_construct_constraint_transform,sk_destruct_constraint_transform);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_transform,argument0);
sk_constraint_transform_local(sk_structure,false);
sk_constraint_transform_relative(sk_structure,false);
sk_constraint_transform_target(sk_structure,noone);
sk_constraint_transform_offset_x(sk_structure,0);
sk_constraint_transform_offset_y(sk_structure,0);
sk_constraint_transform_offset_xscale(sk_structure,0);
sk_constraint_transform_offset_yscale(sk_structure,0);
sk_constraint_transform_offset_yshear(sk_structure,0);
sk_constraint_transform_offset_rotation(sk_structure,0);
sk_constraint_transform_mix_translate(sk_structure,1);
sk_constraint_transform_mix_scale(sk_structure,1);
sk_constraint_transform_mix_shear(sk_structure,1);
sk_constraint_transform_mix_rotate(sk_structure,1);
sk_constraint_transform_setToSetupMix(sk_structure);
return sk_structure;