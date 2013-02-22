//
//  BCoreLocation.m
//  Benihime
//
//  Created by Shiki on 2/22/12.
//

#import "BCoreLocation.h"

#define kEmptyLocation -1000.0

CLLocationDegrees const kBCLEmptyLocation = kEmptyLocation;
CLLocationCoordinate2D const kBCLEmptyLocationCoordinate = { kEmptyLocation, kEmptyLocation };

double const kBCLMetersPerMile = 1609.344;

BOOL BCLCoordinate2DEqualToCoordinate(CLLocationCoordinate2D coordinate1,
                                      CLLocationCoordinate2D coordinate2) {
  return coordinate1.longitude == coordinate2.longitude
    && coordinate1.latitude == coordinate2.latitude;
}

BOOL BCLCoordinate2DIsEmpty(CLLocationCoordinate2D coordinate) {
  return BCLCoordinate2DEqualToCoordinate(coordinate, kBCLEmptyLocationCoordinate);
}
