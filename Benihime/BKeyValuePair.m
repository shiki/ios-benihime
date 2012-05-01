//
//  CKeyValuePair.m
//
//  Created by Shiki on 12/14/11.
//

#import "BKeyValuePair.h"

@implementation BKeyValuePair

@synthesize key;
@synthesize value;

- (id)initWithKey:(id)aKey andValue:(id)aValue {
  if ((self = [super init])) {
    key   = [aKey retain];
    value = [aValue retain];
  }
  return self;
}

- (void)dealloc {
  [key release], key = nil;
  [value release], value = nil;
  [super dealloc];
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
    ret = [key isEqual:((BKeyValuePair *)anObject).key] && [value isEqual:((BKeyValuePair *)anObject).value];
  }
  return ret;
}

@end