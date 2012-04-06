//
//  BCoreLocation.h
//  Benihime
//
//  Created by Shiki on 2/22/12.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Based on http://stackoverflow.com/a/1663317/246142
extern CLLocationDegrees const kBCLEmptyLocation;
extern CLLocationCoordinate2D const kBCLEmptyLocationCoordinate;

extern double const kBCLMetersPerMile;

BOOL BCLCoordinate2DEqualToCoordinate(CLLocationCoordinate2D coordinate1, 
                                      CLLocationCoordinate2D coordinate2);
BOOL BCLCoordinate2DIsEmpty(CLLocationCoordinate2D coordinate);
