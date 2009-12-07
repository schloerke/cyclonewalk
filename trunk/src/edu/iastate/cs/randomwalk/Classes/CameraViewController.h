//
//  CameraViewController.h
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalkData.h"
#import <CoreLocation/CoreLocation.h>

@interface CameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {	
	UIImagePickerController* picker;
	
	NSMutableArray *walkArray;
	UIView *cameraView;
	NSMutableArray *dotArray;
	
}

@property (nonatomic, retain) NSMutableArray *walkArray;
@property (nonatomic, retain) NSMutableArray *dotArray;
@property (nonatomic, retain) UIImagePickerController *picker;
@property (nonatomic, retain) UIView *cameraView;

-(id)initWithWalkArray: (NSMutableArray *)walkArrayP;


/**
 * Launches Camera Display with overlay 
 * @returns yes on successful camera launch
 */
-(BOOL)startCamera:(UIView *)cameraOverlayView;

/**
 * Called when the user has finished selecting an image
 * @see: UIImagePickerController.h
 */
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo;


/**
 * Called if the user has cancels selecting an image
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

/**
 * Allow the user to create a new node based on the 
 * current location and the selected image
 */
- (void)useImage:(UIImage *)theImage;

@end