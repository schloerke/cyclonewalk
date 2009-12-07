//
//  CameraViewOverlay.m
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import "CameraViewOverlay.h"


@implementation CameraViewOverlay

@synthesize navigation;//, nodesOnScreen;

-(id) initWithNavigation:(CameraViewController *) navigationP
{
	self = [self init];
	self.navigation = navigationP;
	//self.nodesOnScreen = [[NSMutableArray alloc] init];
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
		 locationManager.headingFilter = 2.0;
		
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
		NSLog(@"Location manager fialed...%@",[error code]);
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
	location = newLocation.coordinate;
	[self redrawNodes];
	
}

/**
 * Update view on heading change (Compass changes)
 *
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	if (newHeading.headingAccuracy>=2) {
		heading = newHeading.trueHeading; 
		[self redrawNodes];
	}
	
}

- (void) redrawNodes
{
	NSLog(@"Redrawing");
	
	// remove/release old onScreenNodes;
	
	//CGFloat screenHeight = 480; 
	
	//CGFloat screenHeight = 320; 
	
	//CGFloat screenAngleRange = 35; 
	
	//CGFloat angleOffset = getDegreeOffset(newLocation, node.location);
	
	//for nodes in walkList
	
	// if ( (getDegreeOffset(newLocation, node.location) >= 17.5) || (getDegreeOffset(newLocation, node.location) <= - 17.5)) { // node is in view
	
	// distance = newLocation.getDistanceFrom(node.location); 
	
	// yPixelPosition = screenHeight/2; // place node in align nodes in center 
	
	// xPixelPosition = (angleOffset+(screenAngleRange/2))(screenHeight/screenAngleRange);
	
	// addNode(node, distance, xPixelPosition, yPixelPosition );
	
	//}
	
	//}
	
	//remove all nodes from screen
	for(UIView *subView in [self.view subviews]){
		[subView removeFromSuperview];
	}
	
	
	CLLocation *currLocation = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
	CLLocation *nodeLocation;
	double screenHeight = 480; 
	double screenWidth = 320;
	double screenAngleRange = 35;
	
	CGFloat yPixelPosition = screenHeight/2; // place node in align nodes in center 
	
	CGFloat xPixelPosition;// = (angleOffset+(screenAngleRange/2))(screenHeight/screenAngleRange);
	
	BOOL inView = NO;
	BOOL inRange = NO;
	
	double distance = 0;
	
	AppData *appData = [AppData initSingleton];
	CGFloat proximity = appData.proximity;
	
	for(WalkData *walkData in navigation.walkArray){
		for(NodeData *node in [walkData nodeList]){
			double offset = [self getDegreeOffset:node];
			nodeLocation = [[CLLocation alloc] initWithLatitude:node.latitude longitude:node.longitude];
			distance = [currLocation getDistanceFrom:nodeLocation]*3.28084;
			xPixelPosition = (offset+(screenAngleRange/2))*(screenWidth/screenAngleRange);
			inView = (offset<=(screenAngleRange/2) && offset>=(-screenAngleRange/2));
			inRange = (distance <= proximity);
			if(inView && inRange){
				NSLog(@"Found Node. Drawing");
				[self addNode:node distanceInFeet:distance xPixelPosition:xPixelPosition yPixelPosition:yPixelPosition];
			}
			inView = NO;
			inRange = NO;
		    [nodeLocation release];
		}
	}
	
	
			
	//NodeData *node = [[[navigation.walkArray objectAtIndex:0] nodeList] objectAtIndex:0];
	//NSLog(@"%f", [self getDegreeOffset:node]);	
	[currLocation release];
}


/**
 * Place a node on screen given Nodedata and the x y pixel positions
 */
-(void) addNode:(NodeData *)nodeP distanceInFeet:(CGFloat)distance xPixelPosition:(CGFloat)xposP yPixelPosition:(CGFloat)yposP
{
	NSLog(@"Adding node to overlay: %@", nodeP.name);
	DotAndNode *dot = [[DotAndNode alloc] initWithNode:nodeP navigation:self.navigation distanceInFeet:distance color:[UIColor redColor] xPos:xposP yPos:yposP];
	[self.view addSubview:dot.view];
	
	// create a UIButton (UIButtonTypeRoundedRect) and play arround with settings
//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];   
//	button.frame = CGRectMake(100, 100, 100, 50); // size and position of button
//	[button setTitle:@"Add" forState:UIControlStateNormal];
//	button.backgroundColor = [UIColor clearColor];
//	button.adjustsImageWhenHighlighted = YES;    
//	
//	//Add action handler and set current class as target
//	[button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:button];
//	
	
	
	
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


- (double) getDegreeOffset: (NodeData *)node
{
	//CLLocation *nodeLocation = [[CLLocation alloc] initWithLatitude:node.latitude longitude:node.longitude];
	//get the angle of the node from north
	//distance
	//CGFloat feet_per_latitude = 364173.229;
	//CGFloat feet_per_longitude = [MapViewController feetPerLongitudeAngle:location.latitude];	
	
	//convert latitude and longitde to relative to the current location
	double lon1 = node.longitude - location.longitude;
	double lat1 = node.latitude - location.latitude;
	double distance = sqrt(lon1*lon1 + lat1*lat1);
	
	//degree offset from north
	double degreeOffsetN;
	if(lon1>=0 && lat1>=0){
		degreeOffsetN = asin(lon1/distance)*57.295779;
	}
	else if(lon1<0 && lat1<0){
		degreeOffsetN = 180 - asin(abs(lon1)/distance)*57.295779;
	}
	else if(lon1>=0 && lat1<0){
		degreeOffsetN = 180 + asin(lon1/distance)*57.295779;
	}
	else if(lon1<0 && lat1>=0){
		degreeOffsetN = 270 + asin(abs(lon1)/distance)*57.295779;
	}
	
	double degreeOffset = heading - degreeOffsetN;
	return degreeOffset;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	[self startUpdates];
}

-(void)action:(id)sender
{
	NSLog(@"UIButton was clicked");
}

/*- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}*/



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[self.navigation release];
	self.navigation = nil;
	[super dealloc];
}


@end
