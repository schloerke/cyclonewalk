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
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NodeData  *nodeData;

-(id) initWithNodeData: (NodeData *) data;
-(id) initWithCoordinate: (CLLocationCoordinate2D) coord;
-(NSString *)title;
-(NSString *)subtitle;


@end
