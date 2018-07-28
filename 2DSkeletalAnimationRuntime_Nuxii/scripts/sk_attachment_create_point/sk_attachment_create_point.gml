#macro sk_type_attachment_point "ofPointAttachment"
enum SK_ATTACHMENT_POINT{
	X,Y,rotation,
	XWorld,YWorld,rotationWorld,
	sizeof
}
gml_pragma("global","sk_struct_type_add(sk_type_attachment_point,SK_ATTACHMENT_POINT.sizeof,-1,-1);");
/// @desc creates a structure
/// @param name
var sk_structure = sk_struct_create(sk_type_attachment_point,argument0);
sk_attachment_point_x(sk_structure,0);
sk_attachment_point_y(sk_structure,0);
sk_attachment_point_rotation(sk_structure,0);
return sk_structure;