#macro sk_type_attachment_plane "ofPlaneAttachment"
enum SK_ATTACHMENT_PLANE{
	regionKey,
	X,Y,m00,m01,m10,m11,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_attachment_plane,SK_ATTACHMENT_PLANE.sizeof,-1,-1);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_attachment_plane,argument0);
sk_attachment_plane_set_regionKey(sk_structure,undefined);
sk_attachment_plane_set_transform(sk_structure,0,0,1,1,0,0,0);
return sk_structure;