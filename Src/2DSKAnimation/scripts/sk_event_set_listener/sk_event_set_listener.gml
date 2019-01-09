__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_event_exists(argument0);
/// @desc sets a property
/// @param event
/// @param script_id
argument0[@ sk_data_event.listener] = (is_real(argument1)&&script_exists(argument1)) ? argument1 : -1;