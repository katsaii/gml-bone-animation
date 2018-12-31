/// @desc returns the script id if it exists, otherwise defaults to sk_empty_script
/// @param script_id_or_name
if(is_string(argument0)){
	return asset_get_index((asset_get_type(argument0)==asset_script) ? argument0 : "sk_empty_script");
}	return (is_real(argument0)&&script_exists(argument0)) ? argument0 : asset_get_index("sk_empty_script");