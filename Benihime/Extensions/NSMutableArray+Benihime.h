//
//  NSMutableArray+Benihime.h
//  Benihime
//
//  Created by Shiki on 4/4/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NSMutableArray (Benihime)

// Returns the first element of self and removes it (shifting all other elements down by one).
// Returns nil if the array is empty.
- (id)shift;

@end
