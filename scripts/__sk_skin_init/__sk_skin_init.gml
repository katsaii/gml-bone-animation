#macro SK_TYPE_SKIN "skin"
enum sk_data_skin{
	name,
	displays
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_skin.displays] = ds_list_create();
sk_skin_set_name(argument0,undefined);