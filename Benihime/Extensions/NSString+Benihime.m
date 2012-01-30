//
// NSString+Benihime.m
// Benihime
//
// Created by Shiki on 11/7/11.
//

#import "NSString+Benihime.h"

#define ellipsis @"…"

@implementation NSString (Benihime)

////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *) generateUUID
{
  CFUUIDRef theUUID = CFUUIDCreate(NULL);
  CFStringRef string = CFUUIDCreateString(NULL, theUUID);
  CFRelease(theUUID);
  return [(NSString *)string autorelease];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *) trimmedString
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*) stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font
{
  // Create copy that will be the returned result
  NSMutableString *truncatedString = [[self mutableCopy] autorelease];
  
  // Make sure string is longer than requested width
  if ([self sizeWithFont:font].width > width) {
    // Accommodate for ellipsis we'll tack on the end
    width -= [ellipsis sizeWithFont:font].width;
    
    // Get range for last character in string
    NSRange range = {truncatedString.length - 1, 1};
    
    // Loop, deleting characters until string fits within width
    while ([truncatedString sizeWithFont:font].width > width) {
      // Delete character at end
      [truncatedString deleteCharactersInRange:range];
      
      // Move back another character
      range.location--;
    }
    
    // Append ellipsis
    [truncatedString replaceCharactersInRange:range withString:ellipsis];
  }
  
  return truncatedString;
}

@end
