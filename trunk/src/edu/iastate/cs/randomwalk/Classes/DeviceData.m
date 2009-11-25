//
//  DeviceData.m
//  randomwalk
//
//  Created by Patel, Ankit A on 11/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DeviceData.h"

// determines if the device a IPhone 3Gs (Calls hasGPS, hasCamera, hasCompass to determine if the device
//is suitable. They must all return true) 
-(BOOL) isiPhone3Gs;

// Determines if the device has GPS functionality 
-(BOOL) hasGPS;

// Determines if the device has camera functionality 
-(BOOL) hasCame;

// Determines if the device has compass functionality
-(BOOL) hasCompass;

// Gets the version of the iPhone software 
-(NSString *) getSoftwareVersion;



@implementation DeviceData



@end
