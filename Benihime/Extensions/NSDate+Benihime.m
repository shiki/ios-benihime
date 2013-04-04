//
//  NSDate+Benihime.m
//  Benihime
//
//  Created by Shiki on 3/9/12.
//

#import "NSDate+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSDate (Benihime)

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:format];
  return [formatter dateFromString:dateString];
}

- (NSString *)stringWithFormat:(NSString *)format {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:format];
  return [formatter stringFromDate:self];
}

- (NSInteger)hour {
  return [self hourUsingCalendar:[NSCalendar currentCalendar]];
}

- (NSInteger)hourUsingCalendar:(NSCalendar *)calendar {
  NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:self];
  return [components hour];
}

- (NSInteger)month {
  return [self monthUsingCalendar:[NSCalendar currentCalendar]];
}

- (NSInteger)monthUsingCalendar:(NSCalendar *)calendar {
  NSDateComponents *components = [calendar components:NSMonthCalendarUnit fromDate:self];
  return [components month];
}

- (NSInteger)year {
  return [self yearUsingCalendar:[NSCalendar currentCalendar]];
}

- (NSInteger)yearUsingCalendar:(NSCalendar *)calendar {
  NSDateComponents *components = [calendar components:NSYearCalendarUnit fromDate:self];
  return [components year];
}


@end
