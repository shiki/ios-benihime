//
//  UIAlertView+Benihime.m
//  Benihime
//
//  Created by Shiki on 12/15/11.
//

#import "UIAlertView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIAlertView (Benihime)

+ (UIAlertView *)singleButtonAlertView:(NSString *)title message:(NSString *)message
                           buttonTitle:(NSString *)buttonTitle {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message
                                                 delegate:nil cancelButtonTitle:buttonTitle
                                        otherButtonTitles:nil];
  return alert;
}

@end
