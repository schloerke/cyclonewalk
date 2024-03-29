//
//  Compass.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Compass.h"
//#import "CLLocation.h"

@implementation Compass


/*
 Direction values are measured in degrees starting at due north and continue clockwise around the compass. Thus, north is 0 degrees, east is 90 degrees, south is 180 degrees, and so on. A negative value indicates an invalid direction.
 */
+ (double) getDegreeFacing
{
	//return CLLocation.CLLocationDirection;	
	return 0;
}


/*
 Makes the label text value the value of 
 */
-(IBAction) updateLabel:(id) sender
{
	//directionFacing.text = [NSString stringWithFormat:@"%d", d];
}

//tc1=mod(atan2(sin(lon1-lon2)*cos(lat2),
//			  cos(lat1)*sin(lat2)-sin(lat1)*cos(lat2)*cos(lon1-lon2)), 2*pi)


/*
 Calls the getDegreeFacing and returns a character value of the direction facing. i.e. N,NE,E,SE,S,SW,W,NW
 */
-(NSString*) getDirectionFacing
{
	//double direction = [self getDegreeFacing];
	
	double direction = 0;
	// N  == 337.5 <= direction || direction < 22.5
	// NE == 22.5 <= direction < 67.5
	// E  == 67.5 <= direction < 112.5
	// SE == 112.5 <= direction < 157.5
	// S  == 157.5 <= direction < 202.5
	// SW == 202.5 <= direction < 247.5
	// W  == 247.5 <= direction < 292.5
	// NW == 292.5 <= direction < 337.5
	
	if (direction < 67.5 && direction >= 22.5) 
		return @"NE";
	
	else if (direction < 112.5) 
		return @"E";

	else if (direction < 157.5) 
		return @"SE";
	
	else if (direction < 202.5) 
		return @"S";
	
	else if (direction < 247.5) 
		return @"SW";
	
	else if (direction < 292.5) 
		return @"W";
	
	else if (direction < 337.5) 
		return @"NW";
	
	else 
		return @"N";
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
