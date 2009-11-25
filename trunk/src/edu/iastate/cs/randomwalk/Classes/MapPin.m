//
//  MapPin.m
//  randomwalk
//
//  Created by Harsh Goel on 11/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapPin.h"


@implementation MapPin

@synthesize coordinate;
@synthesize pinImage;
@synthesize nodeData;

-(id) initWithNodeData: (NodeData *) data color:(UIColor *) color{
	self = [super init];
	[color retain];
	[data retain];

	nodeData = data;
	coordinate.latitude = data.latitude;
	coordinate.longitude = data.longitude;
	
	//initialize image
	NSString* str;
	
	if([color isEqual:[UIColor blackColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"black-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor blueColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"blue-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor brownColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"brown-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor cyanColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"cyan-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor darkGrayColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"darkGray-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor grayColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"gray-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor greenColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"green-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor lightGrayColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"lightGray-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor magentaColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"magenta-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor orangeColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"orange-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor purpleColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"purple-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor redColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"red-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor whiteColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"white-pin.png" ofType:nil inDirectory:@""];
	}
	else if([color isEqual:[UIColor yellowColor]]){
		str = [[NSBundle mainBundle] pathForResource:@"red-pin.png" ofType:nil inDirectory:@""];
	}
	else{ //default color is purple
		str = [[NSBundle mainBundle] pathForResource:@"purple-pin.png" ofType:nil inDirectory:@""];
	}
	pinImage = [UIImage imageWithContentsOfFile:str];
	[pinImage retain];
	[color release];
	[data release];
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
	[pinImage release];
	[super dealloc];
}

@end
