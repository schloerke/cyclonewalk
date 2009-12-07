//
//  MainView.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "CameraViewOverlay.h"


@implementation MainView

@synthesize appData, walks;


// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tBController didSelectViewController:(UIViewController *)viewController {
	//	NSLog(@"Selected View Controller: %@", [viewController name]);
	NSLog(@"Selected View Controller: %d", 	[tBController.viewControllers indexOfObject:viewController]);
	
	NSMutableArray *tbarControllers = (NSMutableArray *) tBController.viewControllers;
	
	switch ([tBController.viewControllers indexOfObject:viewController]) {
		case 0:
			NSLog(@"Re initializing the camera view");
			[tbarControllers replaceObjectAtIndex:0 withObject:[[[CameraViewController alloc] initWithWalkArray:[[AppData initSingleton] applicationSelectedWalks]] autorelease]];
			break;
		case 1:
			NSLog(@"Re initializing the map view");
			//AppData *appData = [AppData initSingleton];
			[[tbarControllers objectAtIndex:1] updateMapWithCurrentLocation];
			//[tbarControllers replaceObjectAtIndex:1 withObject:[[MapViewController alloc] initWithWalkArray:appData.applicationSelectedWalks]];
			//NSLog(@"AppData.appSelWalk.Size: %d", [appData.applicationSelectedWalks count]);
			break;
		default:
			break;
	}
	
	tBController.viewControllers = [NSArray arrayWithArray:(NSArray *) tbarControllers];
	
	
}



-(IBAction)pushedStart
{
	NSLog(@"Calling Start");
	
	/*int i,j;
	WalkData *comboWalk = [[WalkData alloc] initNewWalk];
	WalkData *tmpWalk;
	NSLog(@"Default Pos 0 Node Count: %d", [[[appData.defaultWalks objectAtIndex:0] nodeList]count]);
	NSLog(@"User Pos 0 Node Count: %d", [[[appData.userWalks objectAtIndex:0] nodeList] count]);
	for (j =0; j < [walkTableView numberOfSections]; j++) {
		for (i = 0; i < [walkTableView numberOfRowsInSection:j]; i++) {
			
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:j];
			UITableViewCell *cell = [walkTableView cellForRowAtIndexPath:indexPath];
			
			if (cell.accessoryType == UITableViewCellAccessoryCheckmark ) {
				NSLog(@"Checked cell name: %@", cell.textLabel.text);
				
				if(j == 0)
					tmpWalk = [appData.defaultWalks objectAtIndex:i];
				if(j == 1)
					tmpWalk = [appData.userWalks objectAtIndex:i];
				
				NSLog(@"TmpWalk node count: %d", [tmpWalk.nodeList count]);
				int k; 
				for (k = 0; k < [tmpWalk.nodeList count]; k++) {
					[comboWalk addNode:[tmpWalk.nodeList objectAtIndex:k]];
				}
			}
		}
	}
	
	NSLog(@"Combined a walk with %d nodes", [comboWalk.nodeList count]);
	
	//	MapViewController *mview = [[MapViewController alloc] initWithWalk:comboWalk];
	//	NSLog(@"Pushing the Map View");
	//[self.navigationController pushViewController:mview animated:NO];
	//self.navigationController.navigationBarHidden = YES;
	//	[mview release];
	
	[comboWalk release];
	*/
	/////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////
	
	NSMutableArray *selectedWalks = [[NSMutableArray alloc] init];
	
	int i,j;
	WalkData *tmpWalk;
	
	for (j =0; j < [walkTableView numberOfSections]; j++) {
		for (i = 0; i < [walkTableView numberOfRowsInSection:j]; i++) {
			
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:j];
			UITableViewCell *cell = [walkTableView cellForRowAtIndexPath:indexPath];
			
			if (cell.accessoryType == UITableViewCellAccessoryCheckmark ) {
				NSLog(@"Checked cell name: %@", cell.textLabel.text);
				
				if(j == 0)
					tmpWalk = [appData.defaultWalks objectAtIndex:i];
				if(j == 1)
					tmpWalk = [appData.userWalks objectAtIndex:i];
				
				NSLog(@"TmpWalk node count: %d", [tmpWalk.nodeList count]);
				
				[selectedWalks addObject:tmpWalk];
				
				int k; 
				for (k = 0; k < [tmpWalk.nodeList count]; k++) {
					NSLog(@"Node Name: %@",[[tmpWalk.nodeList objectAtIndex:k] name]);
				}
				
			}
		}
	}
	
	
	
	NSLog(@"Combined %d walks", [selectedWalks count]);
	
	//	MapViewController *aview = [[MapViewController alloc] initWithWalkArray:selectedWalks];
	//NSLog(@"Pushing the Map View");
	//	[self.navigationController pushViewController:aview animated:YES];
	//	self.navigationController.navigationBarHidden = NO;
	
	if ([selectedWalks count] == 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Selected Walks" message:@"You must select a walk to view the camera or map." delegate:self cancelButtonTitle:@"BACK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
		
		return;
		
	}
	
	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.delegate = self;
	
	
	
	//	MainView *mainview = [[MainView alloc] initWithAppData];
	
	MapViewController *mapview = [[MapViewController alloc] initWithWalkArray:selectedWalks];
	
	CameraViewController *cameraview = [[CameraViewController alloc] initWithWalkArray:selectedWalks];
	
//	CameraViewOverlay *cvover = [[CameraViewOverlay alloc]init];
//	[cvover addNode:[[[selectedWalks objectAtIndex:0] nodeList] objectAtIndex:0]];
//	
//	[cameraview startCamera:cvover];
	
	Settings *settingsview = [[Settings alloc] initSettings];
	
	//	tabBarController.viewControllers = [NSArray arrayWithObjects:mainview, cameraview, mapview, settingsview, nil];
	tabBarController.viewControllers = [NSArray arrayWithObjects:cameraview, mapview, settingsview, nil];
	
	
	//	[mainview release];
	[mapview release];
	[cameraview release];
	[settingsview release];
	
	
	tabBarController.title = @"Explore";
    // Add the tab bar controller's current view as a subview of the window
	[self.navigationController pushViewController:tabBarController animated:YES];
	self.navigationController.navigationBarHidden = NO;
	
	
	
	
	
	
	//	[aview release];
	appData.applicationSelectedWalks = selectedWalks;
	[selectedWalks release];
	
	
	
	
 
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
			
			if(j == 0)
				[[self.appData.defaultWalks objectAtIndex:indexPath.row] select];
			if(j== 1)
				[[self.appData.userWalks objectAtIndex:indexPath.row] select];
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
			
			if(j == 0)
				[[self.appData.defaultWalks objectAtIndex:indexPath.row] deselect];
			if(j== 1)
				[[self.appData.userWalks objectAtIndex:indexPath.row] deselect];
			
			//			[[walks objectAtIndex:indexPath.row] deselect];
		}
	}
	
	
}


-(id) initWithAppData
{

	self = [[MainView alloc] init];
	
	self.appData = [AppData initSingleton];
	self.walks = self.appData.walkList;
	
	NSLog(@"Walk Count: %d", [self.walks count]);
	
	
	return self;
	
}


/**
 * Updates view and model upon item press to the walk table
 */
- (void)tableView:(UITableView *)tableView 
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected row: %d Name: %@", indexPath.row, [[[tableView cellForRowAtIndexPath:indexPath] textLabel]text]);
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

	if(cell.accessoryType == UITableViewCellAccessoryNone)
	{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		
	
		if(indexPath.section == 0)
			[[appData.defaultWalks objectAtIndex:indexPath.row] select];
		if(indexPath.section == 1)
			[[appData.userWalks objectAtIndex:indexPath.row] select];
		
	}
	else
	{	
		cell.accessoryType = UITableViewCellAccessoryNone;
		if(indexPath.section == 0)
			[[appData.defaultWalks objectAtIndex:indexPath.row] deselect];
		if(indexPath.section == 1)
			[[appData.userWalks objectAtIndex:indexPath.row] deselect];
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

	self.navigationController.navigationBarHidden = YES;

	
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
	BOOL selected;
	if (indexPath.section == 0) {
		// application default
		name = [[appData getWalkNames:NO] objectAtIndex:indexPath.row];
		selected = [[appData.defaultWalks objectAtIndex:indexPath.row] selected];

	}
	else if (indexPath.section == 1) {
		// user favorite
		name = [[appData getWalkNames:YES] objectAtIndex:indexPath.row];
		selected = [[appData.userWalks objectAtIndex:indexPath.row] selected];
		

	}
	
	NSLog(@"Getting Walk By Name");
	if (selected) 
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else 
		cell.accessoryType = UITableViewCellAccessoryNone;

    cell.textLabel.text = name;
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
