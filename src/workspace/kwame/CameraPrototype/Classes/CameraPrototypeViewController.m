//
//  CameraPrototypeViewController.m
//  CameraPrototype
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import "CameraPrototypeViewController.h"

@implementation CameraPrototypeViewController

/**
 * Launches the Camera Picker Controller in place of the current view
 * @return - NO if the camera cannot be launched
 */
/*-(BOOL)launchCamera:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject
{
    if ( (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
		|| (delegateObject == nil) || (controller == nil))
        return NO;
	
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = delegateObject;
    picker.allowsImageEditing = NO;
	
    // Picker is displayed asynchronously.
    [controller presentModalViewController:picker animated:YES];
    return YES;
}*/

/**
 * Launches the Photo Library Picker Controller in place of the current view
 * @return - NO if the photo library picker cannot be launched
 */
-(BOOL)startCameraPickerFromViewController:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject
{
    if ( (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
		|| (delegateObject == nil) || (controller == nil))
        return NO;
	
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = delegateObject;
    picker.allowsImageEditing = NO;
	
	
    // Picker is displayed asynchronously.
    [controller presentModalViewController:picker animated:YES];
    return YES;
}


- (void)imagePickerController:(UIImagePickerController *)	picker 
															didFinishPickingImage:(UIImage *)image 
															editingInfo:(NSDictionary *)editingInfo
{
	// Handle returned image 
    [self imageSelected:image];
	
	// Remove the picker interface and release the picker object.
	[self releaseImagePickerController:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
}

/**
 * Callback function for image picker controllers.
 * Launches the Node Detail view for a new Node and assigns
 * the selected image to the new node
 */
- (void)imageSelected:(UIImage*)theImage
{
	//TODO Store Image to Node
	
	//TODO Launch NodeDetailController
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self startCameraPickerFromViewController:self usingDelegate:self];
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
