
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <CoreLocation/CLLocationManagerDelegate.h> 

@interface MainView : UIView {
    IBOutlet UITextField *altitude;
    IBOutlet UITextField *latitude;
    IBOutlet UITextField *longitude;

	CLLocationManager   *locmanager; 
	BOOL                wasFound;
}

- (IBAction)update;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation ;
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error;

@end
