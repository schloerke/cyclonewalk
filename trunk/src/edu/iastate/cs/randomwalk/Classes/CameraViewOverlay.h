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
#import "Compass.h"

/**
 * Custom Overlay for the 
 */
@interface CameraViewOverlay : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	CLLocationCoordinate2D location;
	double heading;
	//NSMutableArray *nodeList;
	CameraViewController *navigation;
	//NSMutableArray *nodesOnScreen;
}

@property (nonatomic, retain) CameraViewController *navigation;
//@property (nonatomic, retain) NSMutableArray *nodesOnScreen;

//@property (nonatomic, retain) double heading;

-(void) addNode:(NodeData *)nodeP distanceInFeet:(CGFloat)distance xPixelPosition:(CGFloat)xposP yPixelPosition:(CGFloat)yposP; 
-(id) initWithNavigation:(CameraViewController *) navigationP;
- (void) redrawNodes;
- (void)startUpdates;
- (double) getDegreeOffset: (NodeData *)node;
@end
