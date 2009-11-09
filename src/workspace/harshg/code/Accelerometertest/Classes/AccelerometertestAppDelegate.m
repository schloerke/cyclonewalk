//
//  randomwalktestAppDelegate.m
//  randomwalktest
//
//  Created by Goel, Harsh on 11/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AccelerometertestAppDelegate.h"

@implementation AccelerometertestAppDelegate

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
