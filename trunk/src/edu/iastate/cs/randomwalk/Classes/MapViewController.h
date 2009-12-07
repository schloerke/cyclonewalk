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
#import "NodeDetail.h"
#import "math.h"
#import "AppData.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, MKReverseGeocoderDelegate, CLLocationManagerDelegate> {
	MKMapView *mapView;
	CLLocationCoordinate2D location;
	CLLocationManager *locationManager;
	NSMutableArray *nodeList;
}

@property (nonatomic, retain) 	NSMutableArray *nodeList;


/**
 * Initializes the Map View with the given Walk Data Array. The data can 
 * be from multiple walks.
 */ 
- (id) initWithWalkArray : (NSArray *) walkArray;

/**
 * Initializes the Map View with the given Walk Data.
 */ 
//- (id) initWithWalk: (WalkData *) walkData; 


/**
 * Displays data points on top of MapKit for the given walkData
 */
- (void) showNodes: (WalkData *) walkData;

-(void) updateMapWithCurrentLocation;

/*
 * Returns the distance on ground per degree angle of longitude
 */
+ (CGFloat)feetPerLongitudeAngle:(CGFloat) latitude;

@end
