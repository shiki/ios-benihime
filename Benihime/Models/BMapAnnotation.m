//
//  BMapAnnotation.m
//  Benihime
//
//  Created by Shiki on 2/22/12.
//

#import "BMapAnnotation.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BMapAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)inCoordinate {
  if ((self = [super init])) {
    self.coordinate = inCoordinate;
  }
  
  return self;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)inCoordinate title:(NSString *)aTitle {
  if ((self = [super init])) {
    self.coordinate = inCoordinate;
    self.title = aTitle;
  }
  
  return self;  
}

@end
