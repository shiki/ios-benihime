//
//  NSDictionary+Benihime.m
//  Benihime
//
//  Created by Shiki on 1/31/12.
//

#import "NSDictionary+Benihime.h"
#import "NSString+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSDictionary (Benihime)

////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSDictionary *) dictionaryFromParameterString:(NSString *)string
{
  NSMutableDictionary *ret = [NSMutableDictionary dictionary];
  NSArray *pairs = [string componentsSeparatedByString:@"&"];
  for (NSString *pair in pairs) {
    NSArray *keyval = [pair componentsSeparatedByString:@"="];
    if (keyval.count == 2) {
      [ret setObject:[[keyval objectAtIndex:1] urlDecodedString] 
              forKey:[[keyval objectAtIndex:0] urlDecodedString]];
    }
  }
  
  return ret;
}

@end
