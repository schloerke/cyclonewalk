//
//  CameraViewOverlay.m
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import "CameraViewOverlay.h"


@implementation CameraViewOverlay

@synthesize navigation;

-(id) initWithNavigation:(CameraViewController *) navigationP
{
	self = [[CameraViewOverlay alloc] init];
	self.navigation = navigationP;
	
	return self;
}

- (void)startUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
	
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	
    // Set a movement threshold for new events 
    locationManager.distanceFilter = 10.0;
	
	
    [locationManager startUpdatingLocation];
	
	//check if compass is available
	if([locationManager headingAvailable]) {
		 locationManager.headingFilter = 10.0;
		
		NSLog(@"Starting heading updates...");
		[locationManager startUpdatingHeading];
	} else {
		NSLog(@"Compass is not available on this device...");
	}
	
}


/**
 *
 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
		NSLog(@"Location manager fialed...");
}

/**
 * Displayes heading calibration on current view 
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager{
	return YES;
}

/**
 * Update view on location change
 *
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	
	
}

/**
 * Update view on heading change (Compass changes)
 *
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	//	[self redrawNodes:];
	
}


/*- (void) redrawNodes: didUpdateToLocation(CLLocation *)newLocation didUpdateHeading(CLHeading *)newHeading
{
		//remove old nodes
	
		//for nodes in walk
			// calculate if node is on screen, if so where(pixel positions), how big to draw (how close)
	
}*/


/**
 * Place a node on screen given Nodedata and the x y pixel positions
 */
-(void) addNode:(NodeData *) nodeP xPixelPosition:(CGFloat)xposP yPixelPosition:(CGFloat)yposP
{
	NSLog(@"Adding node to overlay: %@", nodeP.name);
	DotAndNode *dot = [[DotAndNode alloc] initWithNode:nodeP navigation:self.navigation distanceInFeet:100 color:[UIColor redColor] xPos:xposP yPos:yposP];
	[self.view addSubview:dot.view];
	
	// create a UIButton (UIButtonTypeRoundedRect) and play arround with settings
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];   
	button.frame = CGRectMake(100, 100, 100, 50); // size and position of button
	[button setTitle:@"Add" forState:UIControlStateNormal];
	button.backgroundColor = [UIColor clearColor];
	button.adjustsImageWhenHighlighted = YES;    
	
	//Add action handler and set current class as target
	[button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	
	
	
	//[dot autorelease];
	
//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[button addTarget:self 
//			   action:@selector(aMethod:)
//	 forControlEvents:UIControlEventTouchDown];
//	[button setTitle:@"Show View" forState:UIControlStateNormal];
//	button.frame = CGRectMake(80.0, 310.0, 160.0, 40.0);
//	NSLog(@"adding tmp button");
//	[self addSubview:button];
//	[button release];
//	
//	UIButton *returnButton;
//	returnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[returnButton setTitle:@"Click here" forState:UIControlStateNormal];
//	returnButton.frame = CGRectMake( 100,50, 100, 50); // provides both a position and a size
//	[self addSubview:returnButton];
}

-(void)action:(id)sender
{
	NSLog(@"UIButton was clicked");
	//label.text = @"Bye World";
}

/*- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}*/


- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[self.navigation release];
	self.navigation =nil;
	[super dealloc];
}


@end
