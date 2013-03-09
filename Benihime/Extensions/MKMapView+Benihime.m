//
//  MKMapView+Benihime.m
//  Benihime
//
//  Created by Shiki on 3/9/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import "MKMapView+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MKMapView (Benihime)

- (void)zoomToRegionWithCenter:(CLLocationCoordinate2D)center
             latitudinalMeters:(CLLocationDistance)latitudinalMeters
            longitudinalMeters:(CLLocationDegrees)longitudinalMeters
                      animated:(BOOL)animated {
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(center,
                                                                     latitudinalMeters,
                                                                     longitudinalMeters);
  MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
  @try {
    [self setRegion:adjustedRegion animated:animated];
  } @catch (NSException *exception) {
    NSLog(@"%s: Exception = %@", __PRETTY_FUNCTION__, exception);
  }
}

- (void)zoomToRegionWithCenter:(CLLocationCoordinate2D)center
             latitudinalMeters:(CLLocationDistance)latitudinalMeters
            longitudinalMeters:(CLLocationDegrees)longitudinalMeters {
  [self zoomToRegionWithCenter:center latitudinalMeters:latitudinalMeters
            longitudinalMeters:longitudinalMeters animated:YES];
}

@end
