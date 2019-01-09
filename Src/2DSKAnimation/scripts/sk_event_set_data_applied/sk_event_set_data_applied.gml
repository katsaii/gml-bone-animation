__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ sk_data_event.appliedBone] = sk_bone_exists(argument1) ? argument1 : argument0[sk_data_event.setupBone];
argument0[@ sk_data_event.appliedString] = is_string(argument2) ? argument2 : argument0[sk_data_event.setupString];
argument0[@ sk_data_event.appliedReal] = is_real(argument3) ? argument3 : argument0[sk_data_event.setupReal];
argument0[@ sk_data_event.appliedInt] = (is_real(argument4)||is_int32(argument4)) ? argument4 : argument0[sk_data_event.setupInt];
argument0[@ sk_data_event.appliedSound] = (is_real(argument5)&&audio_exists(argument5)) ? argument5 : argument0[sk_data_event.setupSound];