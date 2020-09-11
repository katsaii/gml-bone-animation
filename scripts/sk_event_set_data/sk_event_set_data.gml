__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param bone
/// @param string
/// @param real
/// @param int
/// @param sound
argument0[@ sk_data_event.setupBone] = sk_bone_exists(argument1) ? argument1 : undefined;
argument0[@ sk_data_event.setupString] = string(argument2);
argument0[@ sk_data_event.setupReal] = real(argument3);
argument0[@ sk_data_event.setupInt] = int64(floor(argument4));
argument0[@ sk_data_event.setupSound] = (is_real(argument5)&&audio_exists(argument5)) ? argument5 : -1;