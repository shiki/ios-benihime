//
//  UIView+Benihime.m
//  Benihime
//
//  Created by Shiki on 12/7/11.
//

#import "UIView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (Benihime)

- (UIView *)findFirstResponder {
  if (self.isFirstResponder) {
    return self;
  }

  for (UIView *subView in self.subviews) {
    UIView *firstResponder = [subView findFirstResponder];

    if (firstResponder != nil) {
      return firstResponder;
    }
  }

  return nil;
}

- (UIView *)findAndResignFirstResponder {
  UIView *firstResponder = [self findFirstResponder];
  if (firstResponder)
    [firstResponder resignFirstResponder];
  return firstResponder;
}

- (void)setTapResignsFirstResponder {
  UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(benihimeDidTapView:)];
  gesture.cancelsTouchesInView = NO;
  [self addGestureRecognizer:gesture];
}

- (void)benihimeDidTapView:(UITapGestureRecognizer *)gesture {
  [self findAndResignFirstResponder];
}

- (UIView *)ancestorWithClass:(Class)ancestorClass {
  return [self.class ancestorOfView:self withClass:ancestorClass];
}

+ (UIView *)ancestorOfView:(UIView *)child withClass:(Class)ancestorClass {
  if (!child.superview)
    return nil;
  if ([child.superview isKindOfClass:ancestorClass])
    return child.superview;
  return [self.class ancestorOfView:child.superview withClass:ancestorClass];
}

- (UIView *)descendantWithClass:(Class)descendantClass {
  return [self.class descendantOfView:self withClass:descendantClass];
}

+ (UIView *)descendantOfView:(UIView *)parent withClass:(Class)descendantClass {
  // Search direct children first
  for (UIView *child in parent.subviews) {
    if ([child isKindOfClass:descendantClass])
      return child;
  }
  // Search grandchildren.
  for (UIView *child in parent.subviews) {
    UIView *match = [self.class descendantOfView:child withClass:descendantClass];
    if (match)
      return match;
  }

  return nil;
}

- (UIView *)childWithClass:(Class)childClass {
  return [self.class childOfView:self withClass:childClass];
}

+ (UIView *)childOfView:(UIView *)parent withClass:(Class)childClass {
  for (UIView *child in parent.subviews) {
    if ([child isKindOfClass:childClass])
      return child;
  }

  return nil;
}

- (UIViewController *)firstAvailableViewController {
  // convenience function for casting and to "mask" the recursive function
  return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id)traverseResponderChainForUIViewController {
  id nextResponder = [self nextResponder];
  if ([nextResponder isKindOfClass:[UIViewController class]]) {
    return nextResponder;
  } else if ([nextResponder isKindOfClass:[UIView class]]) {
    return [nextResponder traverseResponderChainForUIViewController];
  } else {
    return nil;
  }
}
@end
