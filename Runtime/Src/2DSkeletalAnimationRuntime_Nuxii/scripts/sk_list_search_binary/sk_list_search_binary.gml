/// @desc search for an index
/// @param id
/// @param value
/// @param step
/// @param min
/// @param max
var MIN = argument3 div argument2;
var MAX = argument4 div argument2;
var low = MIN;
var high = MAX;
if(high<1){ return low; }
while(low<=high){
	var mid = (low+high)>>1; // find average
	//show_message(string(high)+" "+string(low)+" "+string(mid));
	var val = argument0[| mid*argument2];
	if(val>argument1){
		high = mid-1;
	} else if(val<argument1){
		low = mid+1;
	} else {
		return mid*argument2;
	}
}
return max(low*argument2 - argument2,0);