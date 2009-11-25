//
//  MapPin.h
//  randomwalk
//
//  Created by Harsh Goel on 11/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NodeData.h"

@interface MapPin : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NodeData *nodeData;
	UIImage *pinImage;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NodeData  *nodeData;
@property (nonatomic, readonly) UIImage *pinImage;


-(id) initWithNodeData: (NodeData *)data color:(UIColor*)color;
-(id) initWithCoordinate: (CLLocationCoordinate2D) coord;
-(NSString *)title;
-(NSString *)subtitle;


@end
