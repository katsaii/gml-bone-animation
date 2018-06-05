#macro sk_type_event "ofEvent"
enum SK_EVENT{
	callingScript,
	dBone,dString,dReal,dInt,dSound,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_event,SK_EVENT.sizeof,sk_construct_event,-1);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_event,argument0);
sk_event_set_script(sk_structure,sk_ev_default);
sk_event_set_data(sk_structure,noone,"",0,0,-1);
return sk_structure;