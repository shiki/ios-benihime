//
//  BKeyValuePair.h
//
//  Created by Shiki on 12/14/11.
//

#import <Foundation/Foundation.h>

// stolen from http://stackoverflow.com/questions/7566586/custom-single-keyvaluepair-class-vs-nsmutabledictionary
@interface BKeyValuePair : NSObject {
  id key;
  id value;
}

@property (nonatomic, retain) id key;
@property (nonatomic, retain) id value;

- (id)initWithKey:(id)aKey andValue:(id)aValue;

@end