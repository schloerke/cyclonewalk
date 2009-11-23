//
//  Accelerometer.m
//  randomwalk
//
//  Created by Harsh Goel on 11/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Accelerometer.h"


@implementation Accelerometer

-(void) init{
	accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.updateInterval = .1;
	accelerometer.delegate = self;
}

-(NSArray *)getOrientation{
	
	NSArray *orientation;
	
	NSNumber *forwardTilt, *sidewaysTilt, *compassDirection;
	
	if (zValue<0) {
		forwardTilt = [NSNumber numberWithInt:(yValue+1)*90];
	}
	else {
		forwardTilt = [NSNumber numberWithInt:180 + (1-yValue)*90];
	}
	
	if (yValue<0) {
		int side = xValue>0? xValue*90 : 360+(xValue*90);
		sidewaysTilt = [NSNumber numberWithInt:side];
	}
	else {
		int side = xValue>0? 180-(xValue*90) : 180-(xValue*90);
		sidewaysTilt = [NSNumber numberWithInt:side];
	}

	//TODO add Compass Direction
	compassDirection = [NSNumber numberWithInt:0];
	
	
//	orientation = [[NS
	
	orientation = [[NSMutableArray alloc] initWithCapacity:3];
	orientation = [orientation arrayByAddingObject:forwardTilt];
	orientation = [orientation arrayByAddingObject:sidewaysTilt];
	orientation = [orientation arrayByAddingObject:compassDirection];

	[orientation autorelease];
	
	return orientation;	
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {	
	xValue = acceleration.x;
	yValue = acceleration.y;
	zValue = acceleration.z;
}

@end
