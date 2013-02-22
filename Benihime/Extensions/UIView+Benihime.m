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

@end
