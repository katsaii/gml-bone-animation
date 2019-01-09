#macro SK_TYPE_EVENT "event"
enum sk_data_event{
	name,
	listener,
	defaultBone,
	defaultString,
	defaultReal,
	defaultInt,
	defaultSound
}
/// @desc initialise
/// @param variable
sk_event_set_name(argument0,undefined);
sk_event_set_data(argument0,undefined,"",0.0,0,-1);
sk_event_set_listener(argument0,-1);