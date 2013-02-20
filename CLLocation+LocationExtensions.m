//
//  CLLocation+LocationExtensions.m
//  Created by Sean Carpenter on 2/7/13.
//  Copyright (c) 2013 Clever Armadillo LLC. All rights reserved.
//

#import "CLLocation+LocationExtensions.h"
#import <tgmath.h>

@implementation CLLocation (LocationExtensions)

-(CLLocation*) locationAtDistance:(CLLocationDistance) distance andBearing:(CLLocationDegrees) bearing {
    // This calculation is taken wholesale from http://www.movable-type.co.uk/scripts/latlong.html
    // Taken from the "Destination point given distance and bearing from start point" section
    const int R = 6371000;
    // Bearing needs to be in radians
    double bearingRad = bearing * M_PI / 180;
    double dOverR = distance/R;
    // Lat and lon need to be radians, too
    double currentLat = self.coordinate.latitude * M_PI / 180;
    double currentLon = self.coordinate.longitude * M_PI / 180;
    double newLat = asin(sin(currentLat)*cos(dOverR) + cos(currentLat)*sin(dOverR)*cos(bearingRad));
    double newLon = currentLon + atan2(sin(bearingRad)*sin(dOverR)*cos(currentLat), cos(dOverR) - sin(currentLat)*sin(newLat));
    
    // Convert back to degrees for the CLLocation
    CLLocation* new = [[CLLocation alloc] initWithLatitude:newLat * 180 / M_PI longitude:newLon * 180 / M_PI];
    //NSLog(@"Calc'd distance: %f", [self distanceFromLocation:new]);
    return new;
}

-(CLLocationDegrees) bearingTo:(CLLocation*) otherPoint {
    // This calculation is taken wholesale from http://www.movable-type.co.uk/scripts/latlong.html
    // Taken from the "Bearing" section

    // Everything in radians first.
    double thisLat = self.coordinate.latitude * M_PI / 180;
    double thisLon = self.coordinate.longitude * M_PI / 180;
    double otherLat = otherPoint.coordinate.latitude * M_PI / 180;
    double otherLon = otherPoint.coordinate.longitude * M_PI / 180;
    
    // Do the actual calculation
    double y = sin(otherLon - thisLon) * cos(otherLat);
    double x = cos(thisLat)*sin(otherLat) - sin(thisLat)*cos(otherLat)*cos(otherLon - thisLon);
    
    double bearing = atan2(y, x) * 180 / M_PI;
    
    // Convert the range -180 to 180 to 0 to 360.
    return fmod(bearing + 360, 360.0);
}

@end
