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

/**
 *  Returns nil if the object pointed to by key is NSNull.
 *
 *  @param key The key
 *
 *  @return The object. Will be nil if the real object is NSNull
 */
- (id)safeObjectForKey:(id)key;

@end
