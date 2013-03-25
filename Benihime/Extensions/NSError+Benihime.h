//
//  NSError+Benihime.h
//  Benihime
//
//  Created by Shiki on 3/24/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Benihime)

+ (instancetype)errorWithLocalizedDescription:(NSString *)description;
+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain;
+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain code:(NSInteger)code;
+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain code:(NSInteger)code
                                     userInfo:(NSDictionary *)dict;

@end
