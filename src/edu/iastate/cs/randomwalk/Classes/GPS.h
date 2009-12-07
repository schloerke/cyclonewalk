//
//  GPS.h
//  randomwalk
//
//  Created by Patel, Ankit A on 11/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

//Provides access to available location provider (GPS, WIFI triangulation). 


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GPS : NSObject {
}

//Determines if the GPS is enabled
+(BOOL) hasGPSEnabled;

//Get the curent longitude and latitude position of the device
+(CLLocationCoordinate2D) getCurrentLocation;

//Calculate distance (in meters) from two longitude/latitude coordinates
+(double) getDistance:(CLLocation *) point;

+(BOOL) isWithinDistance:(CGFloat )distanceP nodeProximity:(CGFloat)nodeProxi walkProximity:(CGFloat)walkProxi;


@end
