#macro sk_type_constraint_physics "ofPhysicsConstraint"
enum SK_CONSTRAINT_PHYSICS{
	rigid,boneSystem,boneEffector, /* if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob */
	XGrav,YGrav,damping,
	XGravFinal,YGravFinal,dampingFinal,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_constraint_physics,SK_CONSTRAINT_PHYSICS.sizeof,sk_construct_constraint_physics,sk_destruct_constraint_physics);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_constraint_physics,argument0);
sk_constraint_physics_set_rigid(sk_structure,false);
sk_constraint_physics_set_effector(sk_structure,noone);
sk_constraint_physics_set_setupMix(sk_structure,0,0,1);
sk_constraint_physics_setToSetupMix(sk_structure);
return sk_structure;