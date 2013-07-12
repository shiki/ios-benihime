//
//  BUIScrollView.m
//  Benihime
//
//  Created by Shiki on 2/20/12.
//

#import "BMacros.h"
#import "BCGeometry.h"
#import "BUIScrollView.h"
#import "UIView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BUIScrollView

- (id)init {
  if ((self = [super init]))
    [self onInit];
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super initWithCoder:aDecoder]))
    [self onInit];
  return self;
}

- (id)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame]))
    [self onInit];
  return self;
}

- (void)onInit {
  self.visibleRectMargin = CGSizeMake(0.f, 10.f);
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didMoveToSuperview {
  [super didMoveToSuperview];
  
  NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
  [nc addObserver:self selector:@selector(keyboardDidShow:) 
             name:UIKeyboardDidShowNotification object:nil];
  [nc addObserver:self selector:@selector(keyboardWillHide:) 
             name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardDidShow:(NSNotification *)notification {
  NSDictionary *info = [notification userInfo];
  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
  if (B_UI_ORIENTATION_IS_LANDSCAPE()) // reverse width/height
    kbSize = CGSizeMake(kbSize.height, kbSize.width);
  
  NSInteger height = kbSize.height + _heightAdjustOnVisibleKeyboard;
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, height, 0.0);
  self.contentInset = contentInsets;
  self.scrollIndicatorInsets = contentInsets;  
  
  UIView *firstResponder = [self findFirstResponder];
  if (firstResponder && firstResponder != self) {
    CGRect f = [firstResponder.superview convertRect:firstResponder.frame toView:self];
    f = BCGRectExpand(f, _visibleRectMargin.width, _visibleRectMargin.height);
    [self scrollRectToVisible:f animated:YES];
  }
}

- (void)keyboardWillHide:(NSNotification *)notification {
  [UIView animateWithDuration:0.2f animations:^{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
  }];
}

@end
