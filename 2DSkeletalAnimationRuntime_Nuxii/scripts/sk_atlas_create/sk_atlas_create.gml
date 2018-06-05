#macro sk_type_atlas "ofAtlas"
enum SK_ATLAS{
	texturePage,
	UV_left,UV_top,UV_right,UV_bottom,
	subTextureMap,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_atlas,SK_ATLAS.sizeof,sk_construct_atlas,sk_destruct_atlas);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_atlas,argument0);
return sk_structure;