/// @desc create
/// @param [sprite
/// @param index]
var sk_obj = sk_object_create(SK_TYPE_ATLAS);
if(argument_count>1) then sk_atlas_set_page(sk_obj,argument[0],argument[1]);
return sk_obj;