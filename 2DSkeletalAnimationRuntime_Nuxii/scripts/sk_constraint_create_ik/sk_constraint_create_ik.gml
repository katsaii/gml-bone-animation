#macro sk_type_constraint_ik "ofIKConstraint"
enum SK_CONSTRAINT_IK{
	chain,boneJoint,boneEffector,
	bendDir,weight,
	bendDirFinal,weightFinal,
	sizeof
}
#macro sk_bendDir_positive 1
#macro sk_bendDir_negative -1
gml_pragma("global","sk_struct_type_add(sk_type_constraint_ik,SK_CONSTRAINT_IK.sizeof,-1,-1);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_ik,argument0);
sk_constraint_ik_bendDir(sk_structure,sk_bendDir_negative);
sk_constraint_ik_weight(sk_structure,1);
sk_constraint_ik_chain(sk_structure,false);
sk_constraint_ik_bone_joint(sk_structure,noone);
sk_constraint_ik_bone_effector(sk_structure,noone);
sk_constraint_ik_setToSetupMix(sk_structure);
return sk_structure;