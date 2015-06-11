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
@implementation NSDictionary (Benihime)

+ (NSDictionary *)dictionaryFromParameterString:(NSString *)string {
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

- (NSString *)jsonString:(NSJSONWritingOptions)opt {
  NSError *error = nil;
  NSData *data = [NSJSONSerialization dataWithJSONObject:self options:opt error:&error];
  if (data) {
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
  } else {
    return nil;
  }
}

- (NSString *)jsonString {
  return [self jsonString:0];
}

- (id)safeObjectForKey:(id)key {
  id obj = [self objectForKey:key];
  if ([NSNull.null isEqual:obj]) {
    return nil;
  } else {
    return obj;
  }
}

@end
