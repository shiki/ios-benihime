//
//  BMapAnnotation.h
//  Benihime
//
//  Created by Shiki on 2/22/12.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

// A basic map annotation
@interface BMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id) initWithCoordinate:(CLLocationCoordinate2D)inCoordinate;
- (id) initWithCoordinate:(CLLocationCoordinate2D)inCoordinate title:(NSString *)title;

@end
