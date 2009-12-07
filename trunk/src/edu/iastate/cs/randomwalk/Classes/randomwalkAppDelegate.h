//
//  randomwalkAppDelegate.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#define dFilename        @"default.plist"
#define uFilename        @"user.plist"
#define proximityFilename @"proximity.plist"


@interface randomwalkAppDelegate : NSObject <UIApplicationDelegate> {
    
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (NSString *)applicationDocumentsDirectory;
- (NSString *)dataFilePath: (BOOL) user;
- (NSString *)proximityPath;

@end

