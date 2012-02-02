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

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *) urlDecodedString
{
  NSString *ret = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  return [ret stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// From: http://stackoverflow.com/a/2435502/246142
- (NSString *) uppercasedFirstLetterString
{
  return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[self substringToIndex:1] uppercaseString]];
}

@end
