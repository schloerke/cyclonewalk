//
//  CameraViewOverlay.h
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Custom Overlay for the 
 */
@interface CameraViewOverlay : UIView {
	CLLocationManager *locationManager;
	CLLocationCoordinate2D location;
	NSMutableArray *nodeList;
}

@end
