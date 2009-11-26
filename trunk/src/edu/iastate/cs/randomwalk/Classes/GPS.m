//
//  GPS.m
//  randomwalk
//
//  Created by Patel, Ankit A on 11/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GPS.h"
#import "DeviceData.h"


@implementation GPS

//Determines if the GPS is enabled
+(BOOL) hasGPSEnabled{
	return [DeviceData hasGPS] ;
}
 
//Get the curent longitude and latitude position of the device
+(CLLocationCoordinate2D) getCurrentLocation{
	NSLog(@"\n\nCP1\n\n");
	CLLocationCoordinate2D retVal = [[[CLLocation alloc] init] coordinate];
	double latitude = retVal.latitude;
	double longitude = retVal.longitude;
	NSLog(@"Latitude: %f  Longitude: %f", latitude, longitude);
	return retVal;
}
//Calculate distance (in meters) from two longitude/latitude coordinates
+(double) getDistance:(CLLocation *) point;{
	CLLocationCoordinate2D currLoc = [self getCurrentLocation];
	CLLocation *pointCurr = [[CLLocation alloc] initWithLatitude:currLoc.latitude longitude:currLoc.longitude];
	return [pointCurr getDistanceFrom:point];
}


@end
