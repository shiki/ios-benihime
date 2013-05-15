//
//  UIView+Benihime.h
//  Benihime
//
//  Created by Shiki on 12/7/11.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIView (Benihime)

// From: http://stackoverflow.com/q/1823317/246142
- (UIView *)findFirstResponder;
// From: http://stackoverflow.com/q/1823317/246142
- (UIView *)findAndResignFirstResponder;

- (void)setTapResignsFirstResponder;

- (UIView *)ancestorWithClass:(Class)ancestorClass;
+ (UIView *)ancestorOfView:(UIView *)child withClass:(Class)ancestorClass;

@end
