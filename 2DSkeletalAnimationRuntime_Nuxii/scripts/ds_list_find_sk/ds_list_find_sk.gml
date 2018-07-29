/// @desc locates a structure
/// @param id
/// @param nameOrID
/// @param type
var sk_list = argument0;
var sk_record_count = ds_list_size(sk_list);
var sk_record_id;
for(sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_record = sk_list[| sk_record_id];
	if(
		sk_struct_exists(sk_record)&&
		(sk_struct_get_type(sk_record)==argument2)&&
		(
			(sk_struct_get_name(sk_record)==argument1)||
			(sk_record_id==argument1)
		)
	){
		return sk_record;
	}
}
return noone;