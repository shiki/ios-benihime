//
//  UIViewController+Benihime.h
//  Benihime
//
//  Created by Shiki on 11/16/11.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIViewController (Benihime)

// Used for adding a UIViewController's view on top another VC. This will allow for transparent
// backgrounds. Implementation is based on:
// http://stackoverflow.com/questions/2578614/transparent-background-with-a-modal-uiviewcontroller/2578694#2578694
- (void)addControllerViewAsSubView:(UIViewController *)controller animated:(BOOL)animated;
- (void)removeControllerViewAsSubView:(UIViewController *)controller animated:(BOOL)animated;

- (BOOL)isModal;

// Note that this has to be set on the "presenting" viewcontroller
- (void)setBackButtonTitle:(NSString *)title;

- (void)setNeedsStatusBarAppearanceUpdateIfSupported;
- (void)setAutomaticallyAdjustsScrollViewInsetsIfSupported:(BOOL)autoAdjust;

@end
