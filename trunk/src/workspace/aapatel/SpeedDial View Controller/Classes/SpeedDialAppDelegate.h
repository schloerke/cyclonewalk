

#import <UIKit/UIKit.h>

@class SpeedDialViewController;

@interface SpeedDialAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet SpeedDialViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SpeedDialViewController *viewController;

@end

