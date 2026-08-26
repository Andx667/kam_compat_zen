#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

// --- KAT (KAT - Advanced Medical / KAM) reference macros ---
#define KAT_PREFIX kat

#define KAT_ADDON(component) DOUBLES(KAT_PREFIX,component)

#define KATGVAR(module,var) TRIPLES(KAT_PREFIX,module,var)
#define QKATGVAR(module,var) QUOTE(KATGVAR(module,var))
#define QQKATGVAR(module,var) QUOTE(QKATGVAR(module,var))

#define KATFUNC(module,function) TRIPLES(DOUBLES(KAT_PREFIX,module),fnc,function)
#define QKATFUNC(module,function) QUOTE(KATFUNC(module,function))
#define QQKATFUNC(module,function) QUOTE(QKATFUNC(module,function))

#define KATPATHTOF(component,path) \x\kat\addons\component\path
#define QKATPATHTOF(component,path) QUOTE(KATPATHTOF(component,path))

// Reference KAM's own stringtable entries (its "component" is its own COMPONENT
// name, e.g. "chemical", "key" is the same key from its stringtable.xml) instead
// of duplicating its text into ours. Mirrors CBA's ELSTRING/ECSTRING pattern.
#define KATLSTRING(component,key) QUOTE(TRIPLES(STR,DOUBLES(KAT_PREFIX,component),key))
#define KATCSTRING(component,key) QUOTE(TRIPLES($STR,DOUBLES(KAT_PREFIX,component),key))
#define KATLLSTRING(component,key) localize KATLSTRING(component,key)

// --- ACE reference macros (same idea as the KAT ones above, for ACE3 itself) ---
#define ACE_PREFIX ace

#define ACEGVAR(component,var) TRIPLES(ACE_PREFIX,component,var)
#define QACEGVAR(component,var) QUOTE(ACEGVAR(component,var))
#define QQACEGVAR(component,var) QUOTE(QACEGVAR(component,var))

#define ACEFUNC(component,function) TRIPLES(DOUBLES(ACE_PREFIX,component),fnc,function)
#define QACEFUNC(component,function) QUOTE(ACEFUNC(component,function))
#define QQACEFUNC(component,function) QUOTE(QACEFUNC(component,function))

#define ACELSTRING(component,key) QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,component),key))
#define ACECSTRING(component,key) QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,component),key))
#define ACELLSTRING(component,key) localize ACELSTRING(component,key)

#define ACEPATHTOF(component,path) \z\ace\addons\component\path
#define QACEPATHTOF(component,path) QUOTE(ACEPATHTOF(component,path))

// --- Shared ZEN context menu category ---
// Every kcz_* component that adds a ZEN right-click action nests it under this
// single class so they all appear under one "KAM" entry in the context menu.
// This name must stay identical (not component-derived) across every
// CfgContext.hpp that extends it.
#define KAM_MENU_CATEGORY kcz_context_kam
