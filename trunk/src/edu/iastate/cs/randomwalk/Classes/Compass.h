//
//  Compass.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Compass : UIViewController {
	UILabel *directionFacing;

}


/*
 Direction values are measured in degrees starting at due north and continue clockwise around the compass. Thus, north is 0 degrees, east is 90 degrees, south is 180 degrees, and so on. A negative value indicates an invalid direction.
 */
- (double) getDegreeFacing;

/*
 * Returns the degree of the node-- relative to the users current direction. e.g.:
 * 0, 360, -360: node is directly in front of the user 
 * 90, -270 : node is directly right of the user
 * 180, -180: node is directly south of the user
 * 270, -90: node is directly left of the user
 */
- (double) getDegreeOffset: (NodeData *) node;

/*
 Makes the label text value the value of 
 */
-(IBAction) updateLabel:(id) sender;

/*
 Calls the getDegreeFacing and returns a character value of the direction facing. i.e. N,NE,E,SE,S,SW,W,NW
 */
-(NSString*) getDirectionFacing;


@end
