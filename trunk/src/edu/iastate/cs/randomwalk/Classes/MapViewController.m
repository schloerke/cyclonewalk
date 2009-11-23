#import "MainViewController.h"
#import "MainView.h"


@implementation MapViewController


-(id)initWithWalk: (WalkData*) walkData{
	[self showNodes: walkData];
}
	 
/**
 * Adds nodes to the MapView from the provided Walk
 */
-(void)showNodes: (WalkData*) walkData{
	NSMutableArray *nodeList = [walkData nodeList];
	//Add nodes to the mPlacemark array
	for (int i=0; i<[nodeList count]; i++) {
		CLLocationCoordinate2D tempLocation=mapView.userLocation.coordinate;
		tempLocation.latitude = [nodeList latitude];
		tempLocation.longitude = [nodeList longitude];
		PlaceMark *temp = [[PlaceMark alloc] initWithCoordinate:tempLocation];
		[mPlacemark addObject:temp]; 
	}
	[mapView addAnnotations:mPlacemark];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	mapView=[[MKMapView alloc] initWithFrame:self.view.frame];
	mapView.showsUserLocation=TRUE;
	mapView.delegate=self;
	[self.view insertSubview:mapView atIndex:0];
		
	CLLocationManager *locationManager=[[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
	
	[locationManager startUpdatingLocation];
	
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
	MKPinAnnotationView *test=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"parkingloc"];
	test.userInteractionEnabled=TRUE;
	[test setPinColor:MKPinAnnotationColorPurple];
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


- (IBAction)showInfo: (MKPlacemark *)sender{
	MKReverseGeocoder geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:sender.coordinate];
	geocoder.delegate = self;
	[geocoder start];
}

 
@end
