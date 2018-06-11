#macro sk_type_constraint_physics "ofPhysicsConstraint"
enum SK_CONSTRAINT_PHYSICS{
	rigid, /* if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob */
	boneSystem,boneAnchor,boneEffector, /* anchor is the bone the system will be attached to, the effector is where the bones will try to reach to */
	XGrav,YGrav,drive,
	XGravFinal,YGravFinal,driveFinal,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_constraint_physics,SK_CONSTRAINT_PHYSICS.sizeof,sk_construct_constraint_physics,sk_destruct_constraint_physics);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_physics,argument0);
sk_constraint_physics_set_rigid(sk_structure,false);
sk_constraint_physics_set_effectors(sk_structure,noone,noone);
sk_constraint_physics_set_setupMix(sk_structure,0,0,1);
sk_constraint_physics_setToSetupMix(sk_structure);
return sk_structure;