//
//  UINavigationController+Benihime.m
//  Benihime
//
//  Created by Shiki on 12/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UINavigationController+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UINavigationController (Benihime)

- (NSArray *)popToViewControllerWithClass:(Class)aClass animated:(BOOL)animated {
  UIViewController *target = nil;
  for (UIViewController *vc in self.viewControllers) {
    if ([vc isKindOfClass:aClass]) {
      target = vc;
      break;
    }
  }
  if (target)
    return [self popToViewController:target animated:animated];
  else
    return nil;
}

@end
