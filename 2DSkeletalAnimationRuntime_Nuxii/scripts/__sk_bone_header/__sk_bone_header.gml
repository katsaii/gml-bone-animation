#macro sk_type_bone "__sk_bone_header"
enum SK_BONE{
	X,Y,XScale,YScale,XShear,YShear,rotation,
	XApplied,YApplied,XScaleApplied,YScaleApplied,XShearApplied,YShearApplied,rotationApplied,
	XWorld,YWorld,m00,m01,m10,m11,badApplied,
	transformMode,length,parent,
	sizeof
}
#macro sk_transformMode_scale (1<<0)
#macro sk_transformMode_rotate (1<<1)
#macro sk_transformMode_translate (1<<2) /* translate, skew, and reflection are passive flags meaning they are not required */
#macro sk_transformMode_skew (1<<3) /* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) */
#macro sk_transformMode_normal (sk_transformMode_scale|sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noRotation (sk_transformMode_scale|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScale (sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScaleOrRotation (sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_none 0
#macro sk_transformMode_ex_spriter (sk_transformMode_normal&(~sk_transformMode_skew)) /* spriter specific transformMode */
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_BONE.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_bone_transformMode(sk_structure,sk_transformMode_normal);
			sk_bone_length(sk_structure,10);
			sk_bone_parent(sk_structure,noone);
			sk_bone_x(sk_structure,0);
			sk_bone_y(sk_structure,0);
			sk_bone_xscale(sk_structure,1);
			sk_bone_yscale(sk_structure,1);
			sk_bone_xshear(sk_structure,0);
			sk_bone_yshear(sk_structure,0);
			sk_bone_rotation(sk_structure,0);
			sk_bone_setToSetupPose(sk_structure);
			sk_bone_updateWorldTransform(sk_structure);
		}
	break;
}
return 0;