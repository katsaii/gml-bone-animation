gml_pragma("forceinline");
/// @desc returns child ik angle
/// @param x
/// @param y
/// @param l1
/// @param l2
/// @param bendDir
return(darccos(clamp( (argument0*argument0 + argument1*argument1 - argument2*argument2 - argument3*argument3)/max(2*argument2*argument3,0.01) ,-1,1))*-argument4);