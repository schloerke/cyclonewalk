//
//  NodeDetail.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeInfo.h"
#import "NodeData.h"

#define kStdButtonWidth		106.0
#define kStdButtonHeight	40.0

#define kViewTag			1		// for tagging our embedded controls for removal at cell recycle time

static NSString *kSectionTitleKey = @"sectionTitleKey";
static NSString *kLabelKey = @"labelKey";
static NSString *kSourceKey = @"sourceKey";
static NSString *kViewKey = @"viewKey";



@implementation NodeInfo

@synthesize name, description, address, phoneNumber, latitude, longitude, photo, contactInfo;
@synthesize viewArray;

/* 
 Initializes the view and objects with the node information.
 */
-(id) initWithNode:(id)nodeDataP
{
	
	NodeData *nodeDataNew = (NodeData *) nodeDataP;
	
	self = [super init];
	
	self.name = nodeDataNew.name;
	self.description = nodeDataNew.description;
	self.address = nodeDataNew.address;
	self.phoneNumber = nodeDataNew.phoneNumber;
	self.latitude = nodeDataNew.latitude;
	self.longitude = nodeDataNew.longitude;
	self.photo = nodeDataNew.photo;
	self.contactInfo = nodeDataNew.contactInfo;
	
	return self;
	
}

/*
 Initializes the view with blank information
 */
-(id) initNewNode
{
	self = [super init];
	
	return self;	
}



/*
 If the node detail view was initialized with a node, when the view disappears, the said node's info will be replaced.
 */
-(void) replaceNodeInfo
{
	
}

/*
 If the node detail view was NOT initialized with a node, when the view disappears, a new node will be added to the node data.
 */
-(void) addNewNode
{
	
}



/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

+ (UIButton *)buttonWithTitle:	(NSString *)title
					   target:(id)target
					 selector:(SEL)selector
						frame:(CGRect)frame
						image:(UIImage *)image
				 imagePressed:(UIImage *)imagePressed
				darkTextColor:(BOOL)darkTextColor
{	
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	//		button.frame = frame;
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];	
	if (darkTextColor)
	{
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	}
	else
	{
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button;
}

- (UIButton *)imageButton
{	
	if (imageButton == nil)
	{
		// create a UIButton with just an image instead of a title
		
		UIImage *buttonBackground = [UIImage imageNamed:@"whiteButton.png"];
		UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"blueButton.png"];
		
		CGRect frame = CGRectMake(182.0, 5.0, kStdButtonWidth, kStdButtonHeight);
		
		imageButton = [NodeInfo buttonWithTitle:@""
													  target:self
													selector:@selector(action:)
													   frame:frame
													   image:buttonBackground
												imagePressed:buttonBackgroundPressed
											   darkTextColor:YES];
		
		[imageButton setImage:[UIImage imageNamed:@"UIButton_custom.png"] forState:UIControlStateNormal];
		
		// Add an accessibility label to the image.
		[imageButton setAccessibilityLabel:NSLocalizedString(@"ArrowButton", @"")];
		
		imageButton.tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
	}
	return imageButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = NSLocalizedString(@"ButtonsTitle", @"");
	
	self.viewArray = [NSArray arrayWithObjects:
/*							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButton", kSectionTitleKey,
							 @"Background Image", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)grayButton", kSourceKey,
							 self.grayButton, kViewKey,
							 nil],
*/							
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButton", kSectionTitleKey,
							 @"Button with Image", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)imageButton", kSourceKey,
							 self.imageButton, kViewKey,
							 nil] ,
							
/*							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButtonTypeRoundedRect", kSectionTitleKey,
							 @"Rounded Button", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)roundedButtonType", kSourceKey,
							 self.roundedButtonType, kViewKey,
							 nil],
							
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButtonTypeDetailDisclosure", kSectionTitleKey,
							 @"Detail Disclosure", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)detailDisclosureButton", kSourceKey,
							 self.detailDisclosureButtonType, kViewKey,
							 nil],
							
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButtonTypeInfoLight", kSectionTitleKey,
							 @"Info Light", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)infoLightButtonType", kSourceKey,
							 self.infoLightButtonType, kViewKey,
							 nil],
							
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButtonTypeInfoDark", kSectionTitleKey,
							 @"Info Dark", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)infoDarkButtonType", kSourceKey,
							 self.infoDarkButtonType, kViewKey,
							 nil],
							
							[NSDictionary dictionaryWithObjectsAndKeys:
							 @"UIButtonTypeContactAdd", kSectionTitleKey,
							 @"Contact Add", kLabelKey,
							 @"ButtonsViewController.m:\r(UIButton *)contactAddButtonType", kSourceKey,
							 self.contactAddButtonType, kViewKey,
							 nil],*/
							nil];
	
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


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
    return cell;
}

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = nil;
	
	if ([indexPath row] == 0)
	{
		static NSString *kDisplayCell_ID = @"DisplayCellID";
		cell = [self.tableView dequeueReusableCellWithIdentifier:kDisplayCell_ID];
        if (cell == nil)
        {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDisplayCell_ID] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
		else
		{
			// the cell is being recycled, remove old embedded controls
			UIView *viewToRemove = nil;
			viewToRemove = [cell.contentView viewWithTag:kViewTag];
			if (viewToRemove)
				[viewToRemove removeFromSuperview];
		}
		
		cell.textLabel.text = [[self.dataSourceArray objectAtIndex: indexPath.section] valueForKey:kLabelKey];
		
		UIButton *button = [[self.dataSourceArray objectAtIndex: indexPath.section] valueForKey:kViewKey];
		[cell.contentView addSubview:button];
	}
	else
	{
		static NSString *kSourceCellID = @"SourceCellID";
		cell = [self.tableView dequeueReusableCellWithIdentifier:kSourceCellID];
        if (cell == nil)
        {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSourceCellID] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			cell.textLabel.opaque = NO;
            cell.textLabel.textAlignment = UITextAlignmentCenter;
            cell.textLabel.textColor = [UIColor grayColor];
			cell.textLabel.numberOfLines = 2;
			cell.textLabel.highlightedTextColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:12];
        }
		
		cell.textLabel.text = [[self.dataSourceArray objectAtIndex: indexPath.section] valueForKey:kSourceKey];
	}
	
	return cell;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

