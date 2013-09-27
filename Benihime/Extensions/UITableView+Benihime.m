//
//  UITableView+Benihime.m
//  Benihime
//
//  Created by Shiki on 9/27/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//


#import "UITableView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITableView (Benihime)

- (void)setSeparatorInsetIfSupported:(UIEdgeInsets)insets {
  if ([self respondsToSelector:@selector(setSeparatorInset:)])
    [self setSeparatorInset:insets];
}

@end