#import "TouchesAppDelegate.h"

@implementation TouchesAppDelegate

@synthesize window;

- (void)dealloc {
	[window release];
	[super dealloc];
}

@end
