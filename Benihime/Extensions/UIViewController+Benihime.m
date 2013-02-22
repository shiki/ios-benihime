//
//  UIViewController+Benihime.m
//  Benihime
//
//  Created by Shiki on 11/16/11.
//

#import "UIViewController+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIViewController (Benihime)

- (void)addControllerViewAsSubView:(UIViewController *)controller animated:(BOOL)animated {
  [controller viewWillAppear:animated];
  [self.view addSubview:controller.view];
  [controller viewDidAppear:animated];
}

- (void)removeControllerViewAsSubView:(UIViewController *)controller animated:(BOOL)animated {
  [controller viewWillDisappear:animated];
  [controller.view removeFromSuperview];
  [controller viewDidDisappear:animated];
}

- (void)setBackButtonTitle:(NSString *)title {
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                           initWithTitle:title
                                           style:UIBarButtonItemStylePlain target:nil
                                           action:nil];
}

// From: http://stackoverflow.com/a/6349300/246142
- (BOOL)isModal {
  BOOL isModal = ((self.parentViewController && self.parentViewController.modalViewController == self) ||
                  //or if I have a navigation controller, check if its parent modal view controller is self navigation controller
                  ( self.navigationController && self.navigationController.parentViewController && self.navigationController.parentViewController.modalViewController == self.navigationController) || 
                  //or if the parent of my UITabBarController is also a UITabBarController class, then there is no way to do that, except by using a modal presentation
                  [[[self tabBarController] parentViewController] isKindOfClass:[UITabBarController class]]);
  
  //iOS 5+
  if (!isModal && [self respondsToSelector:@selector(presentingViewController)]) {
    
    isModal = ((self.presentingViewController && self.presentingViewController.modalViewController == self) || 
               //or if I have a navigation controller, check if its parent modal view controller is self navigation controller
               (self.navigationController && self.navigationController.presentingViewController && self.navigationController.presentingViewController.modalViewController == self.navigationController) || 
               //or if the parent of my UITabBarController is also a UITabBarController class, then there is no way to do that, except by using a modal presentation
               [[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]]);
    
  }
  
  return isModal;
}

@end
