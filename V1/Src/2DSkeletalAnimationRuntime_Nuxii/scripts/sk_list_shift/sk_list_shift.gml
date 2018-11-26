#macro sk_shift_back -9223372036854775808 /* signed 64 bit integer limit (min) */
#macro sk_shift_front 9223372036854775807 /* signed 64 bit integer limit (max) */
/// @desc shifts a value within a ds_list by x units (this doesn't retain nested list data)
/// @param id
/// @param pos
/// @param x
var pos = argument1;
var pos_min = 0;
var pos_max = ds_list_size(argument0)-1;
if((pos<pos_min)||(pos>pos_max)){
	return;
}
var item = argument0[| pos];
ds_list_delete(argument0,pos);
if(argument2==undefined){ return; }
var pos_new = clamp(pos+argument2,pos_min,pos_max);
if(pos_new==pos_max){
	ds_list_add(argument0,item);
} else {
	ds_list_insert(argument0,pos_new,item);
}