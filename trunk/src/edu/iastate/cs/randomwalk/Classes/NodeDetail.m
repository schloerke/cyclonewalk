//
//  NodeDetail.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/24/09.
//  Copyright 2009 CS 309 Group 8. All rights reserved.
//

#import "NodeDetail.h"



@implementation NodeDetail

@synthesize nodeData;

/* 
 Initializes the view and objects with the node information.
 */
-(id) initWithNode:(NodeData *)nodeDataP
{
	self = [[NodeDetail alloc] init];
	self.nodeData = nodeDataP;
	
	return self;
	
}



-(void) setPhotoImage
{
	NSLog(@"Trying to set the photo image");
	NSLog(@"Photo URL: %@",[self.nodeData.photoURL absoluteString]);	
	photoView.image = photo; //we need to retain the image, and set it in the frame, maybe set other things
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
	NSLog(@"Setting the node data into the details");
	name.text = self.nodeData.name;
	description.text = self.nodeData.description;
	address.text = self.nodeData.address;
	latitude.text = [@"" stringByAppendingFormat:@"%f",  self.nodeData.latitude];
	longitude.text =  [@"" stringByAppendingFormat:@"%f",  self.nodeData.longitude];
	photo = [NodeDetail cropAndResizeImage:[self.nodeData getPhoto] toSize:photoView.frame.size];
	[self setPhotoImage];
	contactInfo.text = self.nodeData.contactInfo;
	
	self.title = NSLocalizedString(self.nodeData.name , @"");
	
	phoneNumberT.text = self.nodeData.phoneNumberString;
	NSLog(@"%@", [self.nodeData.phoneNumber absoluteString]);
}

/*-(IBAction) makeCall
{
	NSLog(@"Trying to make call to: %@", nodeData.phoneNumberString);
	[[UIApplication sharedApplication] openURL:nodeData.phoneNumber];
}*/


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


/*
 * Resizes and crops image to fit into the Detail View's image frame. Can be uses by external classes too
 */
+ (UIImage*)cropAndResizeImage:(UIImage *)imageP toSize:(CGSize)targetSize
{
	UIImage *sourceImage = imageP;
	UIImage *newImage = nil;        
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	CGFloat targetWidth = targetSize.width-2;
	CGFloat targetHeight = targetSize.height-2;
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
	{
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor > heightFactor) 
			scaleFactor = widthFactor; // scale to fit height
        else
			scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
		
        // center the image
        if (widthFactor > heightFactor)
		{
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
		}
        else 
			if (widthFactor < heightFactor)
			{
				thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
			}
	}       
	
	UIGraphicsBeginImageContext(targetSize); // this will crop
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	if(newImage == nil) 
        NSLog(@"could not scale image");
	
	//pop the context to get back to the default
	UIGraphicsEndImageContext();
	return newImage;
}



@end

