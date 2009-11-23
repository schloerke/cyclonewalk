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
	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
}

-(NSArray *)getOrientation{
	
	NSArray *orientation;
	
	NSInteger forwardTilt, sidewaysTilt, compassDirection;
	
	if (zValue<0) {
		forwardTilt = (yValue+1)*90;
	}
	else {
		forwardTilt = 180 + (1-yValue)*90;
	}
	
	if (yValue<0) {
		sidewaysTilt = xValue>0? xValue*90 : 360+(xValue*90);
	}
	else {
		sidewaysTilt = xValue>0? 180-(xValue*90) : 180-(xValue*90);
	}

	compassDirection = 0;

	orientation = [[NSArray alloc] initWithObjects:forwardTilt, sidewaysTilt, compassDirection];
	[orientation autorelease];
	
	return orientation;	
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {	
	xValue = acceleration.x;
	yValue = acceleration.y;
	zValue = acceleration.z;
}

@end
