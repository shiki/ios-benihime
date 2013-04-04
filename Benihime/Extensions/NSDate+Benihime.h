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


@end
