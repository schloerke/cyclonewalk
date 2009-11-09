//
//  Settings.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"


@implementation Settings


/*
 Pushes the Settings view on top of the navigation stack, for a given walk
 */
-(void) initSettings
{

}

/*
 When this function is run, it will call the walkDataController to delete the corresponding node.
 */
-(IBAction) deleteWalk{
}


/*
 when the slider value has changed, the value of the slider will be sent to the proximity range, after being converted properly.
 0% - 15 feet
 25% - 50 yards
 50% - 100 yards
 75% - 1 mile
 95% - 50 miles
 100% - All
 */
-(IBAction) setProximityRangeBySliderValue
{
	
}

/*
 Takes the slider value and changes it to feet.
 */
-(NSInteger) convertSliderValueToFeet
{
	return nil;
}

/*
 Public function to convert a slider value to feet.
 Used for consistency
 */
+(CGFloat ) convertValueToFeet:(CGFloat ) i
{
	//	0% - 15 feet
	//25% - 50 yards
	//50% - 100 yards
	//75% - 1 mile
	//95% - 50 miles
	//100% - All
	
	if(i < .25)
		return i / 0.25 * 45 + 15;
	
	else if(i < .50)
		return  (i - .25) / 0.25 * 285;
	
	 else if (i < .75) 
		return (i - .50) / 0.25 * 5280;
		 
	 else if (i < 0.95) 
		return (i - 0.75) / .2 * 50 * 5280;
	
	else 
		return CGFLOAT_MAX;

}

/*
 sets the label next to the slider with the value of the converted string.
 */ 
- (IBAction) setSliderlabel
{
	
	
}


/*
 Public function to convert feet to string according to the scale above.  
 Used for consistency.
 */
-(NSString*) convertFeetToString:(int) feet
{
	
	NSString *returnString = @"";
	
	if (feet < 150) {
		returnString = [returnString stringByAppendingFormat:@"%d ft.", feet];
	} else if (feet < 5280) {
		;
	}
	
	return returnString;
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
