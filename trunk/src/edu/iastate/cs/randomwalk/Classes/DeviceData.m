//
//  DeviceData.m
//  randomwalk
//
//  Created by Patel, Ankit A on 11/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DeviceData.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation DeviceData

@synthesize locationManager;

// determines if the device is a IPhone 3Gs
+(BOOL) isiPhone3Gs{
	NSString *version = [self getSoftwareVersion];
	if([version isEqualToString:@"iPhone2,1"]){		//device code for 3GS is "iPhone2,1"
		return YES;
	}else{
		return NO;
	}
	
}

// Determines if the device has GPS functionality 
+(BOOL) hasGPS{
	return [[[CLLocationManager alloc] init] locationServicesEnabled];
	
}

// Determines if the device has camera functionality 
+(BOOL) hasCamera{
	return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// Determines if the device has compass functionality
+(BOOL) hasCompass{
	//only the IPhone 3GS supports a compass, thus check if the device is a 3Gs
	return [self isiPhone3Gs];
}


// Gets the version of the iPhone software 
//device codes:
//iPhone Simulator == i386
//iPhone == iPhone1,1
//3G iPhone == iPhone1,2
//3GS iPhone == iPhone2,1
//1st Gen iPod == iPod1,1
//2nd Gen iPod == iPod2,1
+(NSString *) getSoftwareVersion{
	size_t size;
		
	// Set 'oldp' parameter to NULL to get the size of the data
	// returned so we can allocate appropriate amount of space
	sysctlbyname("hw.machine", NULL, &size, NULL, 0); 
		
	// Allocate the space to store name
	char *name = malloc(size);
		
	// Get the platform name
	sysctlbyname("hw.machine", name, &size, NULL, 0);
		
	// Place name into a string
	NSString *version = [NSString stringWithCString:name];
		
	// Done with this
	free(name);
	
	NSLog(@"device: %@", version);
	
	return version;
}

//deallocate memory [memory management]
-(void) dealloc{
	[locationManager release];
	[super dealloc];
}

@end
