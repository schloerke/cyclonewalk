/*
 *  MapViewController.h
 *  randomwalk
 *
 *  Created by Harsh Goel on 11/23/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <MapKit/MKPlacemark.h>
#import <CoreLocation/CoreLocation.h>
#import "WalkData.h"
#import "MapPin.h"
#import "NodeInfo.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, MKReverseGeocoderDelegate, CLLocationManagerDelegate> {
	MKMapView *mapView;
	CLLocationCoordinate2D location; 	
}


/**
 * Initializes the Map View with the given Walk Data. The data can 
 * be from multiple walks.
 */ 
- (id) initWithWalk: (WalkData *) walkData; 


/**
 * Displays data points on top of MapKit for the given walkData
 */
- (void) showNodes: (WalkData *) walkData;


@end
