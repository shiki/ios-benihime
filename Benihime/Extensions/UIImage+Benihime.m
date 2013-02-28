//
//  UIImage+Benihime.m
//  Benihime
//
//  Created by Shiki on 2/25/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import "UIImage+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIImage (Benihime)

// Original Code is by Benjamin Stahlhood
// Copyright (c) 2012 DS Media Labs
// Source: http://www.sourcedrop.net/gTC2a09877843
//
// Modifications were done to not automatically replace the implementation of [UIImage imageNamed]
// but just provide a helper method that can be used if needed.
////////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIImage *)retina4ImageNamed:(NSString *)imageName {
  NSMutableString *imageNameMutable = [imageName mutableCopy];
  NSRange retinaAtSymbol = [imageName rangeOfString:@"@"];
  if (retinaAtSymbol.location != NSNotFound) {
    [imageNameMutable insertString:@"-568h" atIndex:retinaAtSymbol.location];
  } else {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
      NSRange dot = [imageName rangeOfString:@"."];
      if (dot.location != NSNotFound) {
        [imageNameMutable insertString:@"-568h@2x" atIndex:dot.location];
      } else {
        [imageNameMutable appendString:@"-568h@2x"];
      }
    }
  }
  NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageNameMutable ofType:@""];
  if (imagePath) {
    return [UIImage imageNamed:imageNameMutable];
  } else {
    return [UIImage imageNamed:imageName];
  }
  return nil;
}

@end
