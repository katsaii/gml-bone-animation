#macro sk_type_atlas "__sk_atlas_header"
enum SK_ATLAS{
	texturePage,
	UV_left,UV_top,UV_right,UV_bottom,
	subTextureMap,
	sizeof
}
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_ATLAS.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_ATLAS.subTextureMap] = ds_map_create(); // create map for looking up region data
			sk_atlas_page(sk_structure,-1,0);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			var sk_atlas_subtextures = sk_structure[SK_ATLAS.subTextureMap];
			// iterate through subtextures and dispose
			var sk_region_count = ds_map_size(sk_atlas_subtextures);
			var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
			repeat(sk_region_count){
				var sk_region = sk_atlas_subtextures[? sk_region_key];
				if(sk_struct_exists(sk_region)){
					sk_struct_destroy(sk_region);
				}
				// goto to next region
				sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
			}
			// destroy final map
			ds_map_destroy(sk_atlas_subtextures);
		}
	break;
}
return 0;