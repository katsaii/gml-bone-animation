#macro SK_TYPE_EVENT "event"
enum sk_data_event{
	name,
	setupBone,setupString,setupReal,setupInt,setupSound,
	appliedBone,appliedString,appliedReal,appliedInt,appliedSound
}
/// @desc initialise
/// @param variable
sk_event_set_name(argument0,undefined);
sk_event_set_data(argument0,undefined,"",0.0,0,-1);