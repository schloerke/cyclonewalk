//
//  PersistenceAppDelegate.m
//  Persistence
//
// Created by Ankit Patel
//

#import "PersistenceAppDelegate.h"
#import "PersistenceViewController.h"

@implementation PersistenceAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
