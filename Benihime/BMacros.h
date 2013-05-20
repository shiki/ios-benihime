//
//  BMacros.h
//
//  Created by Shiki on 11/23/11.
//

#define B_UI_ORIENTATION_IS_PORTRAIT() UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)
#define B_UI_ORIENTATION_IS_LANDSCAPE() UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)

// http://stackoverflow.com/a/13156390/246142
#define DEVICE_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define DEVICE_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define DEVICE_IS_TALL_IPHONE (DEVICE_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)

/**
 * System Versioning Preprocessor Macros
 * From: http://stackoverflow.com/a/5337804/246142
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/**
 * Null, Nil, Empty String macros
 * From: http://koolistov.net/blog/2012/02/26/nil-null-empty-macros/
 */
#define NIL_IF_NULL(foo) ([[NSNull null] isEqual:foo] ? nil : foo)
#define NULL_IF_NIL(foo) ((foo == nil) ? [NSNull null] : foo)
#define EMPTY_IF_NIL(foo) ((foo == nil) ? @"" : foo)
#define EMPTY_IF_NULL(foo) ([[NSNull null] isEqual:foo] ? @"" : foo)

#define SAFE_EXEC_BLOCK(block, ...) block ? block(__VA_ARGS__) : nil