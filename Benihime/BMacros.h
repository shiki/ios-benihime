//
//  BMacros.h
//
//  Created by Shiki on 11/23/11.
//

#define B_UI_IS_IPAD() UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#define B_UI_ORIENTATION_IS_PORTRAIT() UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)
#define B_UI_ORIENTATION_IS_LANDSCAPE() UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
