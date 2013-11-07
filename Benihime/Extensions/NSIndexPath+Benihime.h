//
//  NSIndexPath+Benihime.h
//  Benihime
//
//  Created by Shiki on 5/20/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NSIndexPath (Benihime)

// Creates an array of NSIndexPath instances with row numbers from the given `startingRow` counting
// up to a total of `count`. For example, if `startingRow` is 3 and the `count` is 4, this will create
// index paths with these rows: 3, 4, 5, 6.
+ (NSArray *)sequentialIndexPathsFromRow:(NSUInteger)startingRow withCount:(NSUInteger)count
                               inSection:(NSUInteger)section;

+ (NSArray *)indexPathsForIndexSet:(NSIndexSet *)indexes withSection:(NSUInteger)section;

@end
