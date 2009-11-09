//
//  PickImageAppDelegate.h
//  PickImage
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickImageAppDelegate : NSObject <UIApplicationDelegate, UIImagePickerControllerDelegate> {
    UIWindow *window;
	UIImagePickerController* imagePickerController;
    UIImageView* imageView;
}

@property (nonatomic, retain) UIWindow *window;

- (void)applicationDidFinishLaunching:(UIApplication *)application;
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end

