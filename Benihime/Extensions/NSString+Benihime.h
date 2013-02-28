//
// NSString+Benihime.h
// Benihime
//
// Created by Shiki on 11/7/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NSString (Benihime)

// From: http://stackoverflow.com/questions/427180/how-to-create-a-guid-uuid-using-the-iphone-sdk/427521#427521
+ (NSString *)generateUUID;

// lazy method
- (NSString *)trimmedString;

// By John Muchow
// From: http://iphonedevelopertips.com/cocoa/truncate-an-nsstring-and-append-an-ellipsis-respecting-the-font-size.html
- (NSString*)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font;

- (NSString *)urlDecodedString;

- (NSString *)uppercasedFirstLetterString;
- (NSString *)lowercasedFirstLetterString;

- (BOOL)contains:(NSString *)aString;
- (BOOL)contains:(NSString *)aString options:(NSStringCompareOptions)mask;

@end
