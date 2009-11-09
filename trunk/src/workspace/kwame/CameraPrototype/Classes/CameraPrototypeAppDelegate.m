//
//  CameraPrototypeAppDelegate.m
//  CameraPrototype
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import "CameraPrototypeAppDelegate.h"
#import "CameraPrototypeViewController.h"

@implementation CameraPrototypeAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	[window addSubview:viewController.view];
	//[viewController launchCamera:viewController usingDelegate:viewController];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
