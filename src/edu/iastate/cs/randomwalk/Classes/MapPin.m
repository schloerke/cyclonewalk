//
//  MapPin.m
//  randomwalk
//
//  Created by Harsh Goel on 11/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapPin.h"


@implementation MapPin

@synthesize coordinate, nodeData;

-(id) initWithNodeData: (NodeData *) data{
	self = [super init];
	if (self!=nil) {
		nodeData = data;
		[data retain];
		coordinate.latitude = data.latitude;
		coordinate.longitude = data.longitude;
	}
	return self;
}


-(id) initWithCoordinate: (CLLocationCoordinate2D) coord{
	self = [super init];
	if (self!=nil) {
		coordinate = coord;
	}
	return self;
}

-(NSString *)title{
	return nodeData.name;
}
-(NSString *)subtitle{
	return nil;
}

-(void) dealloc{
	[nodeData release]; 
	[super dealloc];
}

@end
