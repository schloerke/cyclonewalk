//
//  Accelerometer.h
//  randomwalk
//
//  Created by Harsh Goel on 11/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Accelerometer : NSObject<UIAccelerometerDelegate> {
	double xValue;
	double yValue;
	double zValue;
	
	UIAccelerometer *accelerometer;
}

/**
 * Returns array of depth 3 with the following data: 
 * forward tilt(degrees) – upwards is 00, sreen on top is 90,  
 * upsidedown is 180, screen facing down is 270.
 *
 * sideways tilt(degrees) – portrait is 0, landscapeRight is 90,   
 * Upside-down is 180, landscapeLeft is 270. 
 *
 * compass direction(degrees) – north is 0, East is 90, South is   
 * 180, West is 270. 
 */
- (NSArray*)getOrientation;

-(void) init;

@end

