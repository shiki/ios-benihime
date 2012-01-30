//
//  NSArray+Benihime.h
//  Benihime
//
//  Created by Shiki on 11/29/11.
//

#import <Foundation/Foundation.h>

// Some (if not all) methods in here are inspired by underscore.js (http://documentcloud.github.com/underscore/)
@interface NSArray (Benihime)

// Looks through each value in the array and returns the first one that passes
// a truth test (block returns YES).
- (id) findUsingBlock:(BOOL (^)(id obj))block;

// Produces a new array of values by mapping each value in list through a block. 
- (NSMutableArray *) mapUsingBlock:(id (^)(id obj))block;

@end
