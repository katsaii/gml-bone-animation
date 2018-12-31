#macro sk_type_atlas sk_atlas_create
#macro sk_atlas_var_texturePage 0
#macro sk_atlas_var_UVLeft 1
#macro sk_atlas_var_UVTop 2
#macro sk_atlas_var_UVRight 3
#macro sk_atlas_var_UVBottom 4
#macro sk_atlas_var_subtextures 5
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build();
sk_obj[@ sk_atlas_var_subtextures] = ds_map_create();
sk_atlas_set_page(sk_obj,-1,0);
return sk_obj;