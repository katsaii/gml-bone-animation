#macro SK_TYPE_ANIMATION "animation"
enum sk_data_animation{
	name,
	timelines,
	mainline,
	duration,loop
}
#macro SK_ANIMATION_MAINLINE_TIME 0
#macro SK_ANIMATION_MAINLINE_TIMELINES 1
#macro SK_ANIMATION_MAINLINE_ENTRIES 2
/// @desc initialise
/// @param variable
argument0[@ sk_data_animation.timelines] = ds_list_create();
argument0[@ sk_data_animation.mainline] = ds_list_create();
sk_animation_set_name(argument0,undefined);
sk_animation_set_duration(argument0,0,false);