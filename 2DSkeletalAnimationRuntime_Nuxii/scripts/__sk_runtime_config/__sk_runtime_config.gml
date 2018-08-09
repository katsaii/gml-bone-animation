/// a set of macros used to modify the runtime at compile-time
#macro SK_CONFIG_RELEASE_MODE true /* enabling this will remove any unneccessary checks for whether skeleton data exists */
#macro SK_CONFIG_SAFE_MODE false /* disabling this will remove the size check from sk_struct_exists */