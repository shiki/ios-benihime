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

- (NSInteger)hourUsingCalendar:(NSCalendar *)calendar {
  NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:self];
  return [components hour];
}

- (NSInteger)hour {
  return [self hourUsingCalendar:[NSCalendar currentCalendar]];
}

@end
