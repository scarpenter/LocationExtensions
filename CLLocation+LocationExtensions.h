//
//  CLLocation+LocationExtensions.h
//  Created by Sean Carpenter on 2/7/13.
//  Copyright (c) 2013 Clever Armadillo LLC. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (LocationExtensions)

-(CLLocation*) locationAtDistance:(CLLocationDistance) distance andBearing:(CLLocationDegrees) bearing;
-(CLLocationDegrees) bearingTo:(CLLocation*) otherPoint;

@end
