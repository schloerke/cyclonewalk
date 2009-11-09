//
//  PickImageAppDelegate.m
//  PickImage
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import "PickImageAppDelegate.h"

@implementation PickImageAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	// Create window
    self.window = [[[UIWindow alloc]
					initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	
    // Set up the image picker controller and add it to the view
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = 
	UIImagePickerControllerSourceTypePhotoLibrary;
    [window addSubview:imagePickerController.view];
	
    // Set up the image view and add it to the view but make it hidden
    imageView = [[UIImageView alloc] initWithFrame:[window bounds]];
    imageView.hidden = YES;
    [window addSubview:imageView];
	
    [window makeKeyAndVisible];
}

- (void)imagePickerController:(UIImagePickerController *)picker 
		didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo
{
	// Dismiss the image selection, hide the picker and
	//show the image view with the picked image
	[picker dismissModalViewControllerAnimated:YES];
    imagePickerController.view.hidden = YES;
    imageView.image = image;
    imageView.hidden = NO;
    [window bringSubviewToFront:imageView];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	// Dismiss the image selection and close the program
	[picker dismissModalViewControllerAnimated:YES];
    exit(0);
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
