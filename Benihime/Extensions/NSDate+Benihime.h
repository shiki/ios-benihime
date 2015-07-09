//
//  NSDate+Benihime.h
//  Benihime
//
//  Created by Shiki on 3/9/12.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NSDate (Benihime)

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format;

- (NSString *)stringWithFormat:(NSString *)format;

- (NSInteger)hour;
- (NSInteger)hourUsingCalendar:(NSCalendar *)calendar;
- (NSInteger)month;
- (NSInteger)monthUsingCalendar:(NSCalendar *)calendar;
- (NSInteger)year;
- (NSInteger)yearUsingCalendar:(NSCalendar *)calendar;

/**
 Returns YES if self has the same year, month, and day values as `date`.
 */
- (BOOL)isEqualToDay:(NSDate *)date;

/**
 *  Returns a NSDate with the same value as self but with 0 seconds.
 */
- (NSDate *)dateWithZeroSeconds;

@end
