//
//  UIViewController+Benihime.h
//  Benihime
//
//  Created by Shiki on 12/15/11.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Benihime)

// Note that this has to be set on the "presenting" viewcontroller
- (void) setBackButtonTitle:(NSString *)title;

@end
