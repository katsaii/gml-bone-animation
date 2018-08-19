/// @desc returns the correct script index
/// @param value
return(
	is_string(argument0) ?
		(
			(asset_get_type(argument0)==asset_script) ?
				asset_get_index(argument0)
			:
				-1
		)
	:
		(
			is_real(argument0) ? 
				argument0
			:
				-1
		)
);