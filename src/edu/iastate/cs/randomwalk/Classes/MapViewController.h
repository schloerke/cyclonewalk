//
//  MapViewController.h
//  randomwalk
//
//  Created by Harsh Goel on 11/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKReverseGeocoder.h>


/** 
 * MapViewController is the controller for the application’s Map                 
 * View
 */ 
@interface MapViewController : UIViewController {
	MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	IBOutlet UISegmentedControl *mapType;
	
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

