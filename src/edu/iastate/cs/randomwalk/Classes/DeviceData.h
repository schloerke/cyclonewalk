//
//  DeviceData.h
//  randomwalk
//
//  Created by Patel, Ankit A on 11/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DeviceData : NSObject {
	CLLocationManager *locationManager;
}

@property(retain,nonatomic) CLLocationManager *locationManager;

// determines if the device a IPhone 3Gs (Calls hasGPS, hasCamera, hasCompass to determine if the device
//is suitable. They must all return true) 
+(BOOL) isiPhone3Gs;

// Determines if the device has GPS functionality 
+(BOOL) hasGPS;

// Determines if the device has camera functionality 
+(BOOL) hasCamera;

// Determines if the device has compass functionality
+(BOOL) hasCompass;

// Gets the version of the iPhone software 
+(NSString *) getSoftwareVersion;



@end
