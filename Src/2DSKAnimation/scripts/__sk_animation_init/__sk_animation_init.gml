#macro SK_TYPE_ANIMATION "animation"
enum sk_data_animation{
	name,
	timelines,
	mainline,
	duration,loop
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_animation.timelines] = ds_list_create();
argument0[@ sk_data_animation.mainline] = ds_list_create();
sk_animation_set_name(argument0,undefined);
sk_animation_set_duration(argument0,0,false);