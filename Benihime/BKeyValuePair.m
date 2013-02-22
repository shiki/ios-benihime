//
//  CKeyValuePair.m
//
//  Created by Shiki on 12/14/11.
//

#import "BKeyValuePair.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKeyValuePair

- (id)initWithKey:(id)aKey andValue:(id)aValue {
  if ((self = [super init])) {
    self.key = aKey;
    self.value = aValue;
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone {
  BKeyValuePair *copy = [[BKeyValuePair allocWithZone:zone] init];
  [copy setKey:self.key];
  [copy setValue:self.value];
  return copy;
}

- (BOOL)isEqual:(id)anObject {
  BOOL ret;
  if (self == anObject) {
    ret = YES;
  } else if (![anObject isKindOfClass:[BKeyValuePair class]]) {
    ret = NO;
  } else {
    ret = [_key isEqual:((BKeyValuePair *)anObject).key] && [_value isEqual:((BKeyValuePair *)anObject).value];
  }
  return ret;
}

@end