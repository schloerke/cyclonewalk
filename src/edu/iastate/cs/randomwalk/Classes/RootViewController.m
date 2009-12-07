//
//  RootViewController.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "NodeData.h"
#import "NodeDetail.h"
#import "MainView.h"
#import "XMLParse.h"
#import "DeviceData.h"
#import "GPS.h"
#import <CoreLocation/CoreLocation.h>

@implementation RootViewController

@synthesize fetchedResultsController, managedObjectContext;


#pragma mark -
#pragma mark View lifecycle

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


- (void)viewDidLoad {
    [super viewDidLoad];

	// Set up the edit and add buttons.
/*    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
	
	NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 * /
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	*/

/*	NodeData *nodeData = [NodeData alloc];
	nodeData.name = @"Bob";
	[nodeData setPhoneNum:@"123-456-7890"];
	 //	nodeData.phoneNumber = @"123-456-789";
	nodeData.description = @"My Description";
	nodeData.address = @"123 Nowhere Lane\nAmes, IA 50010";
	nodeData.longitude = 45;	
	nodeData.latitude = (CGFloat) 46 ;
	nodeData.contactInfo = @"Barret Schloerke";
	nodeData.photoURL = nil;
*/		
	
	

	
	//XMLParse *xmlPar = [[XMLParse alloc] init];
	//appData = [xmlPar startParsing];

	[[[[XMLParse alloc] init] autorelease] startParsingThread];
	 
	 
	 appData = [AppData initSingleton];
	 
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
	 
	

	MainView *mview = [[MainView alloc] initWithAppData];
	NSLog(@"Pushing the MainView");
	[self.navigationController pushViewController:mview animated:NO];
	self.navigationController.navigationBarHidden = YES;						
	
	[mview release];
	NSLog(@"Done Pushing MainView");
	
	
	NodeData *nodeData = [[[appData.userWalks objectAtIndex:0] nodeList] objectAtIndex:0];
	NSLog(@"Node Name: %@", nodeData.name);
	
	NodeDetail *nodeInfo = [[NodeDetail alloc] initWithNode:nodeData ];
	[nodeData release];
	NSLog(@"Pushing the NodeView");
	//[self.navigationController pushViewController:nodeInfo animated:YES];
	[nodeInfo release];
	NSLog(@"Done Pushing NodeView");
	
	
	
	NSLog(@"\nCheck Device Parameters");
	NSLog(@"%@",([DeviceData isiPhone3Gs] ? @"Is a iPhone3Gs" : @"Is NOT a iPhone3Gs"));
	NSLog(@"%@",([DeviceData hasGPS] ? @"has a GPS unit" : @"has NO GPS unit"));
	NSLog(@"%@",([DeviceData hasCamera] ? @"has a camera" : @"does NOT have a camera"));
	NSLog(@"%@",([DeviceData hasCompass] ? @"has a compass" : @"does NOT have a compass"));
	NSLog(@"%@",[DeviceData getSoftwareVersion]);

	
	NSLog(@"\n Check GPS ! Parameters");
	CLLocation *point = [[CLLocation alloc] initWithLatitude:42.02091 longitude: -93.634946];
	NSLog(@"Latitude: %lf \nLongitude: %lf \n", point.coordinate.latitude, point.coordinate.longitude);
	//NSLog(@"DISTANCE FROM HERE TO HILTON: %lf", [GPS getDistance:point]);
	//CLLocationCoordinate2D coord= [GPS getCurrentLocation];							<------UNCOMMENT THIS LINE!!!!!!
	//NSLog(@"Current Location: Lat: %lf  Long:  %lf", [GPS getCurrentLocation].latitude, [GPS getCurrentLocation].longitude);
	//CLLocation *test1 = [[CLLocation alloc] initWithLatitude:42.27818011 longitude: -71.39553308];
	//CLLocation *test2 = [[CLLocation alloc] initWithLatitude:42.58618012 longitude: -70.39553308];
	//double diff = 0;
	//diff = [test1 getDistanceFrom:test2];
	//NSLog(@"Distance: %lf", diff);
	
	
	
}




/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

- (void)viewDidUnload {
	// Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
	// For example: self.myOutlet = nil;
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Add a new object

- (void)insertNewObject {
	
	// Create a new instance of the entity managed by the fetched results controller.
	NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
	NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
	NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
	
	// If appropriate, configure the new managed object.
	[newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
	
	// Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }
}


#pragma mark -
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = [[managedObject valueForKey:@"timeStamp"] description];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here -- for example, create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
		NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
		[context deleteObject:[fetchedResultsController objectAtIndexPath:indexPath]];
		
		// Save the context.
		NSError *error = nil;
		if (![context save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		}
	}   
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}


#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    /*
	 Set up the fetched results controller.
	*/
	// Create the fetch request for the entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	// Edit the entity name as appropriate.
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
	[fetchRequest setEntity:entity];
	
	// Set the batch size to a suitable number.
	[fetchRequest setFetchBatchSize:20];
	
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
	
	// Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
	NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    aFetchedResultsController.delegate = self;
	self.fetchedResultsController = aFetchedResultsController;
	
	[aFetchedResultsController release];
	[fetchRequest release];
	[sortDescriptor release];
	[sortDescriptors release];
	
	return fetchedResultsController;
}    


// NSFetchedResultsControllerDelegate method to notify the delegate that all section and object changes have been processed. 
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	// In the simplest, most efficient, case, reload the table view.
	[self.tableView reloadData];
}

/*
 Instead of using controllerDidChangeContent: to respond to all changes, you can implement all the delegate methods to update the table view in response to individual changes.  This may have performance implications if a large number of changes are made simultaneously.

// Notifies the delegate that section and object changes are about to be processed and notifications will be sent. 
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	// Update the table view appropriately.
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	// Update the table view appropriately.
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView endUpdates];
} 
 */


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	// Relinquish ownership of any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	[fetchedResultsController release];
	[managedObjectContext release];
    [super dealloc];
}


@end

