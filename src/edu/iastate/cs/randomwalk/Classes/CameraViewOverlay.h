//
//  CameraViewOverlay.h
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DotAndNode.h"

/**
 * Custom Overlay for the 
 */
@interface CameraViewOverlay : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	CLLocationCoordinate2D location;
	NSMutableArray *nodeList;
	CameraViewController *navigation;
}

@property (nonatomic, retain) CameraViewController *navigation;

-(void) addNode:(NodeData *) nodeP xPixelPosition:(CGFloat)xposP yPixelPosition:(CGFloat)yposP;

-(id) initWithNavigation:(CameraViewController *) navigationP;


@end