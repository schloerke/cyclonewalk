//
//  Settings.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppData.h"


@interface Settings : UIViewController {
	CGFloat proximity;
	IBOutlet UILabel *proximityLabel;
	IBOutlet UISlider *slider;
}
@property ( nonatomic) CGFloat proximity;

/*
Pushes the Settings view on top of the navigation stack, for a given walk
 */
-(id) initSettings;

/*
 When this function is run, it will call the walkDataController to delete the corresponding node.
 */
-(IBAction) deleteWalk;


/*
 when the slider value has changed, the value of the slider will be sent to the proximity range, after being converted properly.
 0% - 15 feet
 25% - 50 yards
 50% - 100 yards
 75% - 1 mile
 95% - 50 miles
 100% - All
 */
-(IBAction) setProximityRangeBySliderValue;

/*
 Takes the slider value and changes it to feet.
 */
-(CGFloat) convertSliderValueToFeet;

/*
 Public function to convert a slider value to feet.
 Used for consistency
 */
-(CGFloat) convertValueToFeet:(float) i;

/*
 sets the label next to the slider with the value of the converted string.
 */ 
- (IBAction) setSliderlabel;


/*
 Public function to convert feet to string according to the scale above.  
 Used for consistency.
 */
-(NSString*) convertFeetToString:(CGFloat) feet;


@end
