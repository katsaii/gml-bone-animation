#macro sk_type_constraint_transform "ofTransformationConstraint"
enum SK_CONSTRAINT_TRANSFORM{
	local,relative,boneChildren,boneTarget,
	X,Y,XScale,YScale,YShear,rotation,
	translateMix,scaleMix,shearMix,rotateMix,
	translateMixFinal,scaleMixFinal,shearMixFinal,rotateMixFinal,
	sizeof
}
gml_pragma("global",@"
	sk_struct_type_add(sk_type_constraint_transform,SK_CONSTRAINT_TRANSFORM.sizeof,sk_construct_constraint_transform,sk_destruct_constraint_transform);
");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_transform,argument0);
sk_constraint_transform_set_state(sk_structure,false,false);
sk_constraint_transform_set_target(sk_structure,noone);
sk_constraint_transform_set_offsets(sk_structure,0,0,0,0,0,0);
sk_constraint_transform_set_setupMix(sk_structure,1,1,1,1);
sk_constraint_transform_setToSetupMix(sk_structure);
return sk_structure;