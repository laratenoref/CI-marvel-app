#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "app_background" asset catalog image resource.
static NSString * const ACImageNameAppBackground AC_SWIFT_PRIVATE = @"app_background";

/// The "backgroundDiscover" asset catalog image resource.
static NSString * const ACImageNameBackgroundDiscover AC_SWIFT_PRIVATE = @"backgroundDiscover";

/// The "backgroundFavorites" asset catalog image resource.
static NSString * const ACImageNameBackgroundFavorites AC_SWIFT_PRIVATE = @"backgroundFavorites";

/// The "checked" asset catalog image resource.
static NSString * const ACImageNameChecked AC_SWIFT_PRIVATE = @"checked";

/// The "marvel_logo" asset catalog image resource.
static NSString * const ACImageNameMarvelLogo AC_SWIFT_PRIVATE = @"marvel_logo";

/// The "unchecked" asset catalog image resource.
static NSString * const ACImageNameUnchecked AC_SWIFT_PRIVATE = @"unchecked";

#undef AC_SWIFT_PRIVATE
