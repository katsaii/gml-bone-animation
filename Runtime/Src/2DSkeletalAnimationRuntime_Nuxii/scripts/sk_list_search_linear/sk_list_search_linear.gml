/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var frame_id = argument3;
for(; frame_id < argument4; frame_id+=argument2){
	if(argument0[| frame_id] > argument1){
		return max(frame_id-argument2,0);
	}
}
return max(frame_id-argument2,0);