//
//  NSMutableArray+Benihime.m
//  Benihime
//
//  Created by Shiki on 4/4/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import "NSMutableArray+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSMutableArray (Benihime)

- (id)shift {
  if (self.count > 0) {
    id ret = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return ret;
  } else {
    return nil;
  }
}

@end
