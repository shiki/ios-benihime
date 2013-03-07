//
//  BMacros.h
//
//  Created by Shiki on 11/23/11.
//

#define B_UI_IS_IPAD() UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#define B_UI_ORIENTATION_IS_PORTRAIT() UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)
#define B_UI_ORIENTATION_IS_LANDSCAPE() UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)

/**
 * System Versioning Preprocessor Macros
 * From: http://stackoverflow.com/a/5337804/246142
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
