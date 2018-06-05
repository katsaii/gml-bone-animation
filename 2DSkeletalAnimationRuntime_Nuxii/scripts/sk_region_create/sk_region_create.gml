#macro sk_type_region "ofRegion"
enum SK_REGION{
	uv_ULX,uv_ULY,
	uv_URX,uv_URY,
	uv_BLX,uv_BLY,
	uv_BRX,uv_BRY,
	ox,oy,width,height,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_region,SK_REGION.sizeof,-1,-1);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_region,argument0);
return sk_structure;