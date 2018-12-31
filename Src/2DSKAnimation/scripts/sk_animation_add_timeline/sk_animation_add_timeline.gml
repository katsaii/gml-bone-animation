/// @desc appends a timeline to the animation's timeline list
/// @param animation
/// @param timeline
if(sk_object_class(argument0)==sk_class_timeline){
	ds_list_add(argument0[sk_animation_var_timelines],argument1);
}