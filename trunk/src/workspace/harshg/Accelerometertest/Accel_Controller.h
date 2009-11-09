#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Controller : UIViewController <UIAccelerometerDelegate> {
    IBOutlet UILabel *orientationLabel;
    IBOutlet UILabel *xLabel;
    IBOutlet UILabel *yLabel;
    IBOutlet UILabel *zLabel;
	
	UIAccelerometer *accelerometer;
}

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@end




