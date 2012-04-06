//
//  BUIScrollView.m
//  Benihime
//
//  Created by Shiki on 2/20/12.
//

#import "BUIScrollView.h"
#import "UIView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BUIScrollView

@synthesize heightAdjustOnVisibleKeyboard;

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  
  [super dealloc];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) didMoveToSuperview
{
  [super didMoveToSuperview];
  
  NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
  [nc addObserver:self selector:@selector(keyboardDidShow:) 
             name:UIKeyboardDidShowNotification object:nil];
  [nc addObserver:self selector:@selector(keyboardWillHide:) 
             name:UIKeyboardWillHideNotification object:nil];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) keyboardDidShow:(NSNotification *)notification
{
  NSDictionary *info = [notification userInfo];
  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
  
  NSInteger height = kbSize.height + heightAdjustOnVisibleKeyboard; 
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, height, 0.0);
  self.contentInset = contentInsets;
  self.scrollIndicatorInsets = contentInsets;  
  
  UIView *firstResponder = [self findFirstResponder];
  if (firstResponder && firstResponder != self) {
    CGRect f = BCGRectExpand(firstResponder.frame, 0, 10);
    // @todo this doesn't seem to work well sometimes
    [self scrollRectToVisible:f animated:YES];
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) keyboardWillHide:(NSNotification *)notification
{
  [UIView animateWithDuration:0.2f animations:^{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
  }];
}

@end
