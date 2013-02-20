## About
Included are two straightforward methods on `CLLocation` that provide some convenience calculations that I needed on a recent project.

### -locationAtDistance:andBearing:
The first allows you to calculate a new point at a specified distance and bearing from an existing point.  Usage is straightforward:

```obj-c
#import <CoreLocation/CoreLocation.h>
#import "CLLocation+LocationExtensions.h"

CLLocation* startPoint = [[CLLocation alloc] initWithLatitude:39.90657 longitude:-75.16656];
CLLocation* newPoint = [startPoint locationAtDistance:300 andBearing:180];
NSLog(@"New point: %@", newPoint); // new point is at 39.90387204, -75.16656
```

### -bearingTo:
The second finds the bearing between two existing points.

```obj-c
#import <CoreLocation/CoreLocation.h>
#import "CLLocation+LocationExtensions.h"

CLLocation* startPoint = [[CLLocation alloc] initWithLatitude:39.90657 longitude:-75.16656];
CLLocation* endPoint = [[CLLocation alloc] initWithLatitude:39.90387204 longitude:-75.16656];
CLLocationDegrees bearing = [startPoint bearingTo:endPoint];
NSLog(@"Bearing: %f", bearing); // bearing is 180
```

## License
Simplified BSD License.  See the LICENSE file for details.
