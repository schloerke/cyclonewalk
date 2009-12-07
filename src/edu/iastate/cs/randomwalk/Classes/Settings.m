//
//  Settings.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"


@implementation Settings

@synthesize proximity;


/*
 Pushes the Settings view on top of the navigation stack, for a given walk
 */
-(id) initSettings
{
	self = [[Settings alloc] init];
	self.proximity = [[AppData initSingleton] proximity];
	self.title = @"Settings";
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	CGFloat value = 0;
	if(self.proximity < 60)
		value =  (self.proximity - 15) / 45;
	else if(self.proximity < 300)
		value = (self.proximity - 60) / (300 - 60) * 0.25 + .25;
	else if (self.proximity < 5280) 
		value = (self.proximity - 300) / (5280-300) * 0.25 + 0.5;
	else if (self.proximity < 50*5280) 
		value = (self.proximity - 5280) / (49*5280) * 0.25 + 0.75;
	else 
		value = 1.0;
	
	NSLog(@"Value: %f", value);
	
	slider.value = value;
	
	proximityLabel.text = [Settings convertFeetToString:self.proximity];	
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
-(void) setAppDataWithProximityRange
{
	AppData *appData = [AppData initSingleton];
	appData.proximity = self.proximity;
}

/*
 Takes the slider value and changes it to feet.
 */
-(CGFloat) convertSliderValueToFeet
{
	self.proximity = [Settings convertPercentValueToFeet:slider.value];
	//	[self setAppDataWithProximityRange];
	return self.proximity;
}

/*
 Public function to convert a slider value to feet.
 Used for consistency
 */
+(CGFloat ) convertPercentValueToFeet:(CGFloat ) i
{
	//	0% - 15 feet
	//25% - 50 yards
	//50% - 100 yards
	//75% - 1 mile
	//95% - 50 miles
	//100% - All
	CGFloat value;
	if(i < .25)
		value =  i / 0.25 * 45 + 15;
	
	else if(i < .50)
		value = (i - .25) / 0.25 * (300 - 60) + 60;
	
	 else if (i < .75) 
		value = (i - .50) / 0.25 * (5280 - 300) + 300;
		 
	 else if (i < 0.95) 
		value = (i - 0.75) / .2 * (50 * 5280 - 5280) + 5280;
	
	else 
		value = CGFLOAT_MAX;
	
	//NSInteger valueInt = value * 1000;
	//value = valueInt;
	//	value = value / 1000;
	return value;
	

}

/*
 sets the label next to the slider with the value of the converted string.
 */
- (IBAction) setSliderlabel
{
	[self convertSliderValueToFeet];
	[self setAppDataWithProximityRange];
	proximityLabel.text = [Settings convertFeetToString:self.proximity];
}


/*
 Public function to convert feet to string according to the scale above.  
 Used for consistency.
 */
+(NSString*) convertFeetToString:(CGFloat) feet
{
	NSLog(@"Proximity = %f", [[AppData initSingleton] proximity]);
	NSString *returnString = @"";
	
	if (feet < 150) {
		returnString = [returnString stringByAppendingFormat:@"%f feet", feet];
	} 
	else if (feet < 5280) 
	{
		feet = feet / 3;
		returnString = [returnString stringByAppendingFormat:@"%f yards", feet];
	} 
	else if (feet < (5280 * 50)) 
	{
		feet = feet / 5280;
		returnString = [returnString stringByAppendingFormat:@"%f miles", feet];
	}
	else {
		returnString = @"Infinity";
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
