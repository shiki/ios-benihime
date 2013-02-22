//
//  BKeyValuePair.h
//
//  Created by Shiki on 12/14/11.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// stolen from http://stackoverflow.com/questions/7566586/custom-single-keyvaluepair-class-vs-nsmutabledictionary
@interface BKeyValuePair : NSObject {

}

@property (nonatomic, strong) id key;
@property (nonatomic, strong) id value;

- (id)initWithKey:(id)aKey andValue:(id)aValue;

@end