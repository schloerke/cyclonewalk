//
//  CameraPrototypeAppDelegate.h
//  CameraPrototype
//
//  Created by Owusu, Emmanuel K on 11/8/09.
//  Copyright Iowa State University 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraPrototypeViewController;

@interface CameraPrototypeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CameraPrototypeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CameraPrototypeViewController *viewController;

@end

