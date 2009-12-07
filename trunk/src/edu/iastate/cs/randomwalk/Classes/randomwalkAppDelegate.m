//
//  randomwalkAppDelegate.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "randomwalkAppDelegate.h"
#import "RootViewController.h"
#import "XMLParse.h"


@implementation randomwalkAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	//prevent iPhone from sleeping
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    // Override point for customization after app launch    

	RootViewController *rootViewController = (RootViewController *)[navigationController topViewController];
	rootViewController.managedObjectContext = self.managedObjectContext;
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];

	[[[[XMLParse alloc] init] startParsing] autorelease];
	
	AppData *appData = [AppData initSingleton];
	
	int i;
	
	NSString *userPath = [self dataFilePath:YES];
	if([[NSFileManager defaultManager] fileExistsAtPath:userPath])
	{
		NSArray *userWalksSelected = [[NSArray alloc] initWithContentsOfFile:userPath];
		if ([userWalksSelected count] == [appData.userWalks count]) 
		{
			for (i = 0; i< [userWalksSelected count]; i++) {
				if([[userWalksSelected objectAtIndex:i] boolValue])
				{
					[[appData.userWalks objectAtIndex:i] select];
				}
			}
		}
	}
	
	
	NSString *defaultPath = [self dataFilePath:NO];
	if([[NSFileManager defaultManager] fileExistsAtPath:defaultPath])
	{
		NSArray *defaultWalksSelected = [[NSArray alloc] initWithContentsOfFile:defaultPath];
		if ([defaultWalksSelected count] == [appData.defaultWalks count]) 
		{
			for (i = 0; i< [defaultWalksSelected count]; i++) {
				if([[defaultWalksSelected objectAtIndex:i] boolValue])
				{
					[[appData.defaultWalks objectAtIndex:i] select];
				}
			}
		}
	}
	
	
	NSString *proximityPath = [self proximityPath];
	if([[NSFileManager defaultManager] fileExistsAtPath:proximityPath])
	{
		NSArray *proxiArray = [[NSArray alloc] initWithContentsOfFile:proximityPath];
		NSNumber *proxiNum = [proxiArray objectAtIndex:0];
		CGFloat proxi  = [proxiNum floatValue];
		NSLog(@"Loaded Proximity: %f", proxi);
		
		appData.proximity = proxi;
		[proxiNum release];
		[proxiArray release];
	}
	
	

}



- (NSString *)proximityPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:proximityFilename];
	
}


- (NSString *)dataFilePath: (BOOL) user {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
														 NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	if(user)
	{
		return [documentsDirectory stringByAppendingPathComponent:uFilename];
	}
	else {
		return [documentsDirectory stringByAppendingPathComponent:dFilename];
	}

}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	
	//enable iPhone's sleeping timer
	[[UIApplication sharedApplication] setIdleTimerDisabled:NO];

	
	NSLog(@"trying to save data");
	
	AppData *appData = [AppData initSingleton];
	NSMutableArray *appWalksSelect = [[NSMutableArray alloc] init];
	int i;
	for (i=0; i<[appData.defaultWalks count]; i++) {
		[appWalksSelect addObject: [NSNumber numberWithBool:[[appData.defaultWalks objectAtIndex:i] selected]]];
	}
    [appWalksSelect writeToFile:[self dataFilePath:NO] atomically:YES];
	[appWalksSelect release];
	
	
	NSMutableArray *userWalksSelect = [[NSMutableArray alloc] init];
	for (i=0; i<[appData.userWalks count]; i++) {
		[userWalksSelect addObject: [NSNumber numberWithBool:[[appData.userWalks objectAtIndex:i] selected]]];
	}	
	
    [userWalksSelect writeToFile:[self dataFilePath:YES] atomically:YES];
    [userWalksSelect release];
	

	
	NSNumber *numberProxi = [[NSNumber alloc] initWithFloat:appData.proximity];
	NSMutableArray *proxiArray = [[NSMutableArray alloc] init];
	[proxiArray addObject:numberProxi];
	[proxiArray writeToFile:[self proximityPath] atomically:YES];
    [proxiArray release];
    [numberProxi release];

	
	
	
    NSError *error = nil;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
        } 
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"randomwalk.sqlite"]];
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

