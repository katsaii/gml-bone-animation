/// @desc returns the id of an object if its name corresponds to the input name
/// @param id
/// @param name
/// @param [type]
var sk_list = argument[0];
var sk_name = string(argument[1]);
var sk_type = (argument_count>2) ? argument[2] : undefined;
var sk_item_count = ds_list_size(sk_list);
for(var sk_item_id = 0; sk_item_id<sk_item_count; sk_item_id++){
	var sk_item = sk_list[| sk_item_id];
	if(sk_object_exists(sk_item,sk_type)&&(sk_object_name(sk_item)==sk_name)){
		return sk_item_id;
	}
}
return -1;