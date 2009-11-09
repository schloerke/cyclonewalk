//
//  WalkSettings.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WalkSettings : UITableViewController {
	UIColor *color;
	WalkData *walkData;
}


/*
 Initializes the walk with a particular walk.  The settings will be filled in accordingly.
 */
-(IBAction) initWithWalk:(WalkData *)walkDataP;

/*
 Initializes the walk without a particular walk.  The settings will be blank.
 */
-(IBAction) initNewWalk;

/*
 Sets the color of the walk.
 */
-(IBAction) setColorOfWalk;

/*
 when the slider value has changed, the value of the slider will be sent to the proximity range, after being converted properly.
 0% - 15 feet
 25% - 50 yards
 50% - 100 yards
 75% - 1 mile
 95% - 50 miles
 100% - All
 */
-(IBAction) setProximityRangeFromSlider;




@end
