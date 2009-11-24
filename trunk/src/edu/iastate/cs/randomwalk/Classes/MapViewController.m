#import "MapViewController.h"

@implementation MapViewController


-(id)initWithWalk:(WalkData *)walkDataOrNil{
	
	mapView=[[MKMapView alloc] initWithFrame:self.view.frame];
	mapView.showsUserLocation=TRUE;
	mapView.delegate=self;
	[self.view insertSubview:mapView atIndex:0];
	
	if (self = [super initWithNibName:@"MapView" bundle:nil]) {
		if(walkDataOrNil != nil)
		{
			[self showNodes: walkDataOrNil];
		}
    }
	return self;
}
	 
/**
 * Adds nodes to the MapView from the provided Walk
 */
-(void)showNodes:(WalkData *) walkData{
	NSMutableArray *nodeList = [walkData nodeList];
	
	//Add nodes to the mPlacemark array
	for (int i=0; i<[nodeList count]; i++) {
		
		MapPin *pin = [[MapPin alloc] initWithNodeData:[nodeList objectAtIndex:i]];
		
		[mapView addAnnotation:pin];
		[pin release];
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
		
	/*CLLocationManager *locationManager=[[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
	
	[locationManager startUpdatingLocation];*/
	
	//location = [CLLocation initWithLatitude: 42.025355 longitude: -93.647116];
	//One location is obtained.. just zoom to that location	
	
	location.latitude = 42.025355;
	location.longitude = -93.647116;
	MKCoordinateRegion region;
	region.center=location;
	//Set Zoom level using Span
	MKCoordinateSpan span;
	span.latitudeDelta=.005;
	span.longitudeDelta=.005;
	region.span=span;
	
	[mapView setRegion:region animated:TRUE];
	
}


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
	[mapView release];
    [super dealloc];
}

//GeoCoder delegate functions

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	NSLog(@"Geocoder completed");
	//Do something
}

//MapView delegate functions

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	NSLog(@"View for Annotation is called");
	MKPinAnnotationView *test=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"newAnnotation1"];
	[test autorelease];
	test.userInteractionEnabled=YES;
	test.canShowCallout = YES;
	[test setPinColor:MKPinAnnotationColorPurple];
	//NSString* str = [[NSBundle mainBundle] pathForResource:@"map-pin-small.gif" ofType:nil inDirectory:@""];
	//test.image = [UIImage imageWithContentsOfFile:str];
	test.enabled = YES;
	
	//if([annotation isKindOfClass:[MapPin class]]){
	//	NodeInfo *infoView = [[NodeInfo alloc] initWithNode:((MapPin *)annotation).nodeData];
	//	test.leftCalloutAccessoryView = infoView.tableView;
	//}
	
	return test;
}

//location manager functions
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	location=newLocation.coordinate;
	//One location is obtained.. just zoom to that location
	
	MKCoordinateRegion region;
	region.center=location;
	//Set Zoom level using Span
	MKCoordinateSpan span;
	span.latitudeDelta=.005;
	span.longitudeDelta=.005;
	region.span=span;
	
	[mapView setRegion:region animated:TRUE];
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
}


/*- (IBAction)showInfo: (MKPlacemark *)sender{
	MKReverseGeocoder geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:sender.coordinate];
	geocoder.delegate = self;
	[geocoder start];
}*/

 
@end
