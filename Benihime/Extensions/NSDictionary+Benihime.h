//
//  NSDictionary+Benihime.h
//  Benihime
//
//  Created by Shiki on 1/31/12.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NSDictionary (Benihime)

+ (NSDictionary *)dictionaryFromParameterString:(NSString *)string;
// Converts this dictionary to a JSON string. Returns nil if an error happens when converting.
// This uses the built-in JSON serializer since iOS 5.
- (NSString *)jsonString:(NSJSONWritingOptions)opt;
- (NSString *)jsonString;

@end
