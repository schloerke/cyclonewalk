#import "Controller.h"

 /*
 Simple application that gets the accelerometer data and displays it on screen.
 The data is also processed to give an orientation, i.e, portrait, landscapeLeft, etc.
 */
@implementation Accel_Controller
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	xLabel.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
	yLabel.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
	zLabel.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
	
	float xx = -[acceleration x];
	float yy = [acceleration y];
	float angle = atan2(yy, xx); 
	
	// Add 1.5 to the angle to keep the label constantly horizontal to the viewer.
	[orientationLabel setTransform:CGAffineTransformMakeRotation(angle+1.5)]; 
	
	UIInterfaceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
	// Read my blog for more details on the angles. It should be obvious that you
	// could fire a custom shouldAutorotateToInterfaceOrientation-event here.
	if(angle >= -2.25 && angle <= -0.75)
	{
		if(deviceOrientation != UIInterfaceOrientationPortrait)
		{
			deviceOrientation = UIInterfaceOrientationPortrait;
			[orientationLabel setText:@"UIInterfaceOrientationPortrait"];
		}
	}
	else if(angle >= -0.75 && angle <= 0.75)
	{
		if(deviceOrientation != UIInterfaceOrientationLandscapeRight)
		{
			deviceOrientation = UIInterfaceOrientationLandscapeRight;
			[orientationLabel setText:@"UIInterfaceOrientationLandscapeRight"];
		}
	}
	else if(angle >= 0.75 && angle <= 2.25)
	{
		if(deviceOrientation != UIInterfaceOrientationPortraitUpsideDown)
		{
			deviceOrientation = UIInterfaceOrientationPortraitUpsideDown;
			[orientationLabel setText:@"UIInterfaceOrientationPortraitUpsideDown"];
		}
	}
	else if(angle <= -2.25 || angle >= 2.25)
	{
		if(deviceOrientation != UIInterfaceOrientationLandscapeLeft)
		{
			deviceOrientation = UIInterfaceOrientationLandscapeLeft;
			[orientationLabel setText:@"UIInterfaceOrientationLandscapeLeft"];
		}
	}
	
}
@end
