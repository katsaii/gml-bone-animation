__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param dir
/// @param drive_amount
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ sk_data_physics_constraint.appliedXGravity] = sk_magnitude*dcos(sk_direction);
argument0[@ sk_data_physics_constraint.appliedXGravity] = -sk_magnitude*dsin(sk_direction);
argument0[@ sk_data_physics_constraint.appliedDrive] = is_real(argument2) ? clamp(argument2,0,1) : 1;