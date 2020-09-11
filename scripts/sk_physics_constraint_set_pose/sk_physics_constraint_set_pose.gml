__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param gravity
/// @param dir
/// @param drive_amount
var sk_magnitude = real(argument1);
var sk_direction = real(argument2);
argument0[@ sk_data_physics_constraint.setupXGravity] = sk_magnitude*dcos(sk_direction);
argument0[@ sk_data_physics_constraint.setupXGravity] = -sk_magnitude*dsin(sk_direction);
argument0[@ sk_data_physics_constraint.setupDrive] = is_real(argument3) ? clamp(argument3,0,1) : 1;