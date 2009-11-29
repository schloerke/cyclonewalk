#import "MapViewController.h"

@implementation MapViewController

@synthesize nodeList;

-(id)initWithWalkArray: (NSArray *)walkArrayOrNil{
	mapView=[[MKMapView alloc] initWithFrame:self.view.frame];
	mapView.showsUserLocation=TRUE;
	mapView.delegate=self;
	[self.view insertSubview:mapView atIndex:0];
	
	if (self = [super initWithNibName:@"MapView" bundle:nil]) {
		if(walkArrayOrNil != nil)
		{
			for(WalkData *walk in walkArrayOrNil){
				[self showNodes: walk];
			}
		}
    }
	
	self.title = @"Map";
	
	nodeList = [[NSMutableArray alloc] init];
	
	return self;
}
	

/*-(id)initWithWalk:(WalkData *)walkDataOrNil{
	
	mapView=[[MKMapView alloc] initWithFrame:self.view.frame];
	mapView.showsUserLocation=TRUE;
	mapView.delegate=self;
	[self.view insertSubview:mapView atIndex:0];
	
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

	if (self = [super initWithNibName:@"MapView" bundle:nil]) {
		if(walkDataOrNil != nil)
		{
			[self showNodes: walkDataOrNil];
		}
    }
	return self;
}*/
	 
/**
 * Adds nodes to the MapView from the provided Walk
 */
-(void)showNodes:(WalkData *) walkData{
	NSMutableArray *nList = [walkData nodeList];
	for (int i=0; i<[nList count]; i++) {
		MapPin *pin = [[MapPin alloc] initWithNodeData:[nList objectAtIndex:i] color: walkData.color];		
		NSLog(@"Adding pin: %@", pin.nodeData.name);
		[mapView addAnnotation:pin];
		[pin release];
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
		
	locationManager=[[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
	
	//	[locationManager startUpdatingLocation];
	
	//location = [CLLocation initWithLatitude: 42.025355 longitude: -93.647116];
	//One location is obtained.. just zoom to that location	

	
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
	MKAnnotationView *test=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"newAnnotation1"];
	test.userInteractionEnabled=YES;
	test.canShowCallout = YES;
	test.enabled = YES;
	if([annotation isKindOfClass:[MapPin class]]){
		[test setImage:[((MapPin *)annotation) pinImage]];

		UIButton *button = [UIButton buttonWithType: UIButtonTypeInfoLight];
		
		[button setTitleColor:[UIColor whiteColor] forState:UIControlEventTouchUpInside];

		[button setTitleShadowColor:[UIColor blackColor] forState:UIControlEventAllEvents];

		NodeData *nodeD = ((MapPin *)annotation).nodeData;
		NSLog(@"Node Name: %@", nodeD.name);
		NSLog(@"NodeListCount: %d", [nodeList count]);
		button.tag = [nodeList count];
		[nodeList addObject:nodeD];
		
		
		[button addTarget:self action:@selector(pushNodeDetail:) forControlEvents:UIControlEventTouchUpInside];
		test.rightCalloutAccessoryView = button;
		//[button autorelease];
	}
	[test autorelease];
	return test;
}

-(void) pushNodeDetail:(id)sender
{
	NodeDetail *infoView = [[NodeDetail alloc] initWithNode:[nodeList objectAtIndex:[sender tag]]];
	
	NSLog(@"Pushing the NodeDetail: %@", infoView.nodeData.name);
	[self.navigationController pushViewController:infoView animated:YES];
	self.navigationController.navigationBarHidden = NO;
	[infoView release];
}

//location manager functions
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	NSLog(@"Moving the screen to a new location");
	location = newLocation.coordinate;
	//One location is obtained.. just zoom to that location
	
	//REMOVE!!!!
/*	NSLog(@"1");
	CLLocation *ames;
	NSLog(@"2");
	ames = [[CLLocation alloc] initWithLatitude:42.025355 longitude:-93.647116];
	NSLog(@"3");
	CLLocationCoordinate2D amesCoords;
	NSLog(@"4");
	amesCoords = ames.coordinate;
	NSLog(@"5");
	
			location = amesCoords;
	NSLog(@"6");
 
	*/
	
	MKCoordinateRegion region;
	region.center=location;
	//Set Zoom level using Span
	MKCoordinateSpan span;
	span.latitudeDelta=.020;
	span.longitudeDelta=.020;
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
