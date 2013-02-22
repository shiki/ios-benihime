//
//  NSCharacterSet+Benihime.m
//  Benihime
//
//  Created by Shiki on 8/29/12.
//  Copyright (c) 2012 Shiki. All rights reserved.
//

#import "NSCharacterSet+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSCharacterSet (Benihime)

- (BOOL)stringIsCompatible:(NSString *)aString {
  return [[aString stringByTrimmingCharactersInSet:self] isEqualToString:@""];
}

@end
