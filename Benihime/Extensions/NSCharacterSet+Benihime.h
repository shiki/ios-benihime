//
//  NSCharacterSet+Benihime.h
//  Benihime
//
//  Created by Shiki on 8/29/12.
//  Copyright (c) 2012 Shiki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (Benihime)

// Returns YES if all characters in the string are members of this character set.
- (BOOL)stringIsCompatible:(NSString *)aString;

@end
