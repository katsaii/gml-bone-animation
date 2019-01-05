#macro SK_OBJECT_DEBUG_ASSERTIONS_ENABLED false
#macro SK_OBJECT_DEBUG_ASSERT_EXISTENCE if(SK_OBJECT_DEBUG_ASSERTIONS_ENABLED) then for(var __sk_assertion = undefined; ; { if(bool(__sk_assertion)) then show_error("Skeleton object with reference does not exist.",true); break; }) var __sk_assertion
/// @desc returns whether the value is an object
/// @param variable
/// @param [type]
/// @param [interface]
var sk_exists = false;
var sk_id = ds_list_find_index(global.sk_object_activeObjects,argument[0]);
if(sk_id!=-1){	
	sk_exists = true;
	if((argument_count>1)&&(argument[1]!=undefined)) then sk_exists = sk_exists&&(sk_object_type(argument[0])==argument[1]);
	if((argument_count>2)&&(argument[2]!=undefined)) then sk_exists = sk_exists&&(sk_object_interface(argument[0])==argument[2]);
}
return sk_exists;