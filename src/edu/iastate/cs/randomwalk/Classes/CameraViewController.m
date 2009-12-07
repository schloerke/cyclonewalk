//
//  CameraViewController.m
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//
#import "CameraViewController.h"
#import "CameraViewOverlay.h"

@implementation CameraViewController

@synthesize walkArray;
@synthesize picker;
@synthesize cameraView;
@synthesize dotArray;

-(id)initWithWalkArray: (NSMutableArray *)walkArrayP
{
	self = [[CameraViewController alloc] init];
	self.walkArray = walkArrayP;
	
	self.title = @"Camera";
	
	// Testing, draw node on screen
	NSLog(@"Adding Test Node");
	CameraViewOverlay *cvover = [[CameraViewOverlay alloc] initWithNavigation:self];
	
	[cvover addNode:(NodeData *)[[[walkArrayP objectAtIndex:0] nodeList] objectAtIndex:0] distanceInFeet:100 xPixelPosition:150 yPixelPosition:200];
	[cvover addNode:(NodeData *)[[[walkArrayP objectAtIndex:0] nodeList] objectAtIndex:0] distanceInFeet:0 xPixelPosition:150 yPixelPosition:10];
	[cvover addNode:(NodeData *)[[[walkArrayP objectAtIndex:0] nodeList] objectAtIndex:0] distanceInFeet:10000 xPixelPosition:150 yPixelPosition:100];
	
	[self.view addSubview:cvover.view];
	//[cvover addNode:[[[walkArrayP objectAtIndex:0] nodeList] objectAtIndex:0]];
	
	//launch camera with overlauy
	//[self startCamera:cvover.view];

	return self;
}


/**
 * Launches Camera Display with overlay 
 * @returns yes on successful camera launch
 */
-(BOOL) startCamera:(UIView *)cameraOverlayView {
	if ((cameraOverlayView == nil))
	{
		NSLog(@"Sent a nil overlay view, returning no");
		return NO;
	}
	
	NSLog(@"Attempting to launch Camera");
	if((![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])){
		NSLog(@"Does not have a camera, returning no");
		return NO;
	} // Verify that camera is available
	
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.delegate = self;
	self.picker.showsCameraControls = NO; // Hide Camera Controls
    self.picker.allowsEditing = YES; // user is allowed to edit a selected still image
	//self.picker.cameraOverlayView = cameraOverlayView;
	
    [self presentModalViewController:picker animated:YES];
	NSLog(@"Camera launched successfully!");
    return YES;
}

/**
 * Called when the user has finished selecting an image
 * @see: UIImagePickerController.h
 */
- (void)imagePickerController:(UIImagePickerController *)picker
		didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo
{
    [self useImage:image];
	[self imagePickerControllerDidCancel:self.picker];
}

/**
 * Called if the user has cancels selecting an image
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	// Remove the picker interface and release the picker object.
    [[self.picker parentViewController] dismissModalViewControllerAnimated:YES];
    [self.picker release];
}


/**
 * Allow the user to create a new node based on the 
 * current location and the selected image
 */
- (void)useImage:(UIImage*)theImage
{
	//TODO >> display add new node dialog with image presaved
}


- (void)dealloc {
	self.picker = nil;
	self.walkArray = nil;
	self.cameraView = nil;
	self.dotArray = nil;
	
    [super dealloc];
}

@end
