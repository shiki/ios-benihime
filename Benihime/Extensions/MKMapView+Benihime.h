//
//  MKMapView+Benihime.h
//  Benihime
//
//  Created by Shiki on 3/9/13.
//  Copyright (c) 2013 FuFu Labs. All rights reserved.
//

#import <MapKit/MapKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MKMapView (Benihime)

- (void)zoomToRegionWithCenter:(CLLocationCoordinate2D)center
             latitudinalMeters:(CLLocationDistance)latitudinalMeters
            longitudinalMeters:(CLLocationDegrees)longitudinalMeters;
- (void)zoomToRegionWithCenter:(CLLocationCoordinate2D)center
             latitudinalMeters:(CLLocationDistance)latitudinalMeters
            longitudinalMeters:(CLLocationDegrees)longitudinalMeters
                      animated:(BOOL)animated;

@end
