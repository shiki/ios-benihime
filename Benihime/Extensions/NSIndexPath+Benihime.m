//
//  NSIndexPath+Benihime.m
//  Benihime
//
//  Created by Shiki on 5/20/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import "NSIndexPath+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSIndexPath (Benihime)

+ (NSArray *)sequentialIndexPathsFromRow:(NSUInteger)startingRow withCount:(NSUInteger)count
                               inSection:(NSUInteger)section {
  NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];
  for (int i = 0; i < count; i++) {
    [ret addObject:[NSIndexPath indexPathForRow:startingRow + i inSection:section]];
  }
  return [ret copy];
}

+ (NSArray *)indexPathsForIndexSet:(NSIndexSet *)indexes withSection:(NSUInteger)section {
  NSMutableArray *paths = [NSMutableArray array];

  NSUInteger currentIndex = [indexes firstIndex];
  while (currentIndex != NSNotFound) {
    NSIndexPath *path = [NSIndexPath indexPathForRow:currentIndex inSection:section];
    [paths addObject:path];

    currentIndex = [indexes indexGreaterThanIndex:currentIndex];
  }

  return paths;
}

@end
