//
//  NSError+Benihime.m
//  Benihime
//
//  Created by Shiki on 3/24/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import "NSError+Benihime.h"

@implementation NSError (Benihime)

+ (instancetype)errorWithLocalizedDescription:(NSString *)description {
  return [self errorWithLocalizedDescription:description domain:NSCocoaErrorDomain];
}

+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain {
  return [self errorWithLocalizedDescription:description domain:domain code:0];
}

+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain code:(NSInteger)code {
  return [self errorWithLocalizedDescription:description domain:domain code:code userInfo:nil];
}

+ (instancetype)errorWithLocalizedDescription:(NSString *)description domain:(NSString *)domain code:(NSInteger)code
                                     userInfo:(NSDictionary *)dict {
  NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
  if (dict)
    [userInfo addEntriesFromDictionary:dict];
  if (![userInfo objectForKey:NSLocalizedDescriptionKey])
    [userInfo setObject:description forKey:NSLocalizedDescriptionKey];

  NSError *ret = [NSError errorWithDomain:domain code:code userInfo:userInfo];
  return ret;
}

@end
