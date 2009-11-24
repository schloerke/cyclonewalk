//
//  MainView.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MapViewController.h"


@implementation MainView

@synthesize appData, walks;


-(IBAction)pushedStart
{
	NSLog(@"Calling Start");
	MapViewController *mview = [[MapViewController alloc] initWithWalk:[walks objectAtIndex:0]];
	NSLog(@"Pushing the Map View");
	[self.navigationController pushViewController:mview animated:NO];
	self.navigationController.navigationBarHidden = YES;
 
}

-(IBAction)selectAllRows{
	int i,j;
	
	NSLog(@"Number of Sections: %d", [walkTableView numberOfSections]);
	
	for(j = 0; j < [walkTableView numberOfSections]; j++)
	{
		for (i=0; i < [walkTableView numberOfRowsInSection:j]; i++) {
			NSLog(@"Selecting row:%d section:%d", i,j );
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:j];
			UITableViewCell *cell = [walkTableView cellForRowAtIndexPath:indexPath];
			cell.accessoryType = UITableViewCellAccessoryCheckmark;
			[[walks objectAtIndex:indexPath.row] select];
		}
	}

}

-(IBAction)deselectAllRows{
	
	int i,j;
	for(j = 0; j < [walkTableView numberOfSections]; j++)
	{
		for (i=0; i < [walkTableView numberOfRowsInSection:j]; i++) {
			NSLog(@"Deselecting row:%d section:%d", i,j );
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:j];
			UITableViewCell *cell = [walkTableView cellForRowAtIndexPath:indexPath];

			cell.accessoryType = UITableViewCellAccessoryNone;
			[[walks objectAtIndex:indexPath.row] deselect];
		}
	}
	
	
}


-(id) initWithAppData:(AppData *) aDat
{
	if(self != nil)
	{
		self.appData = aDat;
		self.walks = self.appData.walkList;
	}
	
	NSLog(@"Walk Count: %d", [self.walks count]);
	
	
	return self;
	
}


/**
 * Updates view and model upon item press to the walk table
 */
- (void)tableView:(UITableView *)tableView 
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected row: %d Name: %@", indexPath.row, [[[tableView cellForRowAtIndexPath:indexPath] textLabel]text]);
	
    /*[theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:NO];
	
    UITableViewCell *cell = [theTableView cellForRowAtIndexPath:newIndexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        // update view with walk selection
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
		// update model with walk selection
		//TODO
		
    } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
		
		// update model with walk deselection
		//TODO
    }
	*/
	
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	if(cell.accessoryType == UITableViewCellAccessoryNone)
	{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		[[walks objectAtIndex:indexPath.row] select];
	}
	else
	{	
		cell.accessoryType = UITableViewCellAccessoryNone;
		[[walks objectAtIndex:indexPath.row] deselect];
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

/**
 * Sets up the walk list table in MainView
 */ 
- (void)viewWillAppear {
	walkTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	walkTableView.delegate = self;
	walkTableView.dataSource = self;
	
	
	NSLog(@"Loading Data");
	// calls appropriate methods to set up
	[walkTableView reloadData];
}

/**
 * The walk list table contains two section.
 * A section for the applications predifined Walks
 * and a section for user defined walks 
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/**
 * Returns the number of rows per section
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
	if(section == 0) { // Application Walks
		return [appData getAppWalkCount];
	} else { // User Generated Walks
		return [appData getUserWalkCount];
	}
}

/**
 * Return the section labels
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    //Region *region = [regions objectAtIndex:section];
	NSLog(@"Setting Table Headers");
	
    if(section == 0) // Application Walks
		return @"Random Walks";
	else // User Generated Walks
		return @"Favorite Walks";
}


/**
 * 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSLog(@"Loading Section: %d, Row: %d", indexPath.section, indexPath.row);
    
	static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
   if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
    }
	
	//	WalkData *walk = [[walks objectAtIndex:indexPath.row] name];
	// TODO
	NSString *name;
	if (indexPath.section == 0) {
		// application default
		name = [[appData getWalkNames:NO] objectAtIndex:indexPath.row];
	}
	else if (indexPath.section == 1) {
		// user favorite
		name = [[appData getWalkNames:YES] objectAtIndex:indexPath.row];
	}
    cell.textLabel.text = name;
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self viewWillAppear];
}




/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
