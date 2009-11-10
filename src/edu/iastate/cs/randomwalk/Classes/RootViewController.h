//
//  RootViewController.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
