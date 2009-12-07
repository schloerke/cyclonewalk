//
//  Compass.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NodeData.h"
#import "GPS.h"

@interface Compass : UIViewController {
	UILabel *directionFacing;

}


/*
 Direction values are measured in degrees starting at due north and continue clockwise around the compass. Thus, north is 0 degrees, east is 90 degrees, south is 180 degrees, and so on. A negative value indicates an invalid direction.
 */
+ (double) getDegreeFacing;

/*
 Makes the label text value the value of 
 */
-(IBAction) updateLabel:(id) sender;

/*
 Calls the getDegreeFacing and returns a character value of the direction facing. i.e. N,NE,E,SE,S,SW,W,NW
 */
-(NSString*) getDirectionFacing;


@end
