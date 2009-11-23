#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <MapKit/MKPlacemark.h>
#import <CoreLocation/CoreLocation.h>
#import "WalkData.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, MKReverseGeocoderDelegate, CLLocationManagerDelegate> {
	MKMapView *mapView;
	NSMutableArray *mPlacemarks;
	CLLocationCoordinate2D location; 	
}


/**
 * Initializes the Map View with the given Walk Data. The data can 
 * be from multiple walks.
 */ 
- (void) initWithWalk: (WalkData *) walkData; 


/**
 * Displays data points on top of MapKit for the given walkData
 */
- (void) showNodes: (WalkData *) walkData;

/**
 * Shows info about the selected placemark on screen. Uses the MapKit 
 * Reverse Geocoder which uses the Google Maps API
 */
//-(IBAction)showInfo:(MKPlacemark *)sender;

@end
