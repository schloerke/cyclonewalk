//
//  CameraPrototypeViewController.h
//  CameraPrototype
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraPrototypeViewController : UIViewController <UIImagePickerControllerDelegate>{}

- (BOOL)launchCamera:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject;

- (BOOL)launchPhotoLibrary:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject;

- (void)imagePickerController:(UIImagePickerController *)	picker 
															didFinishPickingImage:(UIImage *)image 
															editingInfo:(NSDictionary *)editingInfo;

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) picker;

- (void)imageSelected:(UIImage*)theImage;

@end

