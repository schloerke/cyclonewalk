//
//  MapViewController.m
//  randomwalk
//
//  Created by Harsh Goel on 11/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

-(id)initWithNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
	if(self = [super initWithNibName:nibNameOrNil bundle: nibBundleOrNil]){
		//Custom Initialization
	}
	return self;
}

//Implement viewDid load to do additional setup
-(void)viewDidLoad {
	[super viewDidLoad];
	
	mapView=[[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.showUserLocation = TRUE;
	mapView.userLocationVisible = TRUE;
	mapView.mapType=MKMapTypeStandard;
	mapView.delegate=self;
	
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.longitudeDelta = 0.2;
	span.latitudeDelta = 0.2;
	
	CLLocationCoordinate2d location = mapView.userLocation.coordinate;
	region.center = location;
	region.span = span;
	//TODO 
	
}	
/**
 *
 *
 */
-(IBAction)changeType: (id) sender;

/**
 * Initializes the Camera View with the given Walk Data. The data can 
 * be from multiple walks.
 */ 
- (void) initWithWalk: (WalkData *) walkData;

/**
 * Controls the click on the touch screen.
 */
- (IBAction) mapClicked: (id) sender;

/**
 * Displays data points on top of MapKit for the given walkData
 */
- (void) showNodes: (WalkData *) walkData;

@end
