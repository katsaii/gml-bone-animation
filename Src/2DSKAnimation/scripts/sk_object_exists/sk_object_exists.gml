/// @desc checks whether the value is a skeleton object
/// @param object
return(
	is_array(argument0)&&
	(array_height_2d(argument0)==2)&&
	(array_length_2d(argument0,1)>=3)
);