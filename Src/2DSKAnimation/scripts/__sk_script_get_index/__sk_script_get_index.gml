/// @desc returns the script id if it exists, otherwise defaults to __sk_empty_script
/// @param script_id_or_name
if(is_string(argument0)&&(asset_get_type(argument0)==asset_script)){
	return asset_get_index(argument0);
}else if(is_real(argument0)&&script_exists(argument0)){
	return argument0;
}	return asset_get_index("__sk_empty_script");