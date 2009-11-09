//
//  HarshTestAppDelegate.m
//  HarshTest
//
//  Created by Goel, Harsh on 11/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HarshTestAppDelegate.h"

@implementation HarshTestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
