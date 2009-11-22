//
//  WalkData.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WalkData.h"




@implementation WalkData

@synthesize name, color, favorite, selected, proximity;



-(int) addNode:(NodeData *)nodeP
{
	NSLog(@"Adding a walk with name: %s", nodeP.name);
	[nodeList addObject:nodeP];
	return [self getNodePosition:nodeP];
}

-(int) deleteNode:(NodeData *)nodeP
{
	NSLog(@"Removing Walk: %s", nodeP.name);
	int pos = [self getNodePosition:nodeP];
	[nodeList removeObjectAtIndex:pos];
	return pos;
}

-(int) deleteWalk:(NodeData *)nodeP
{
	NSLog(@"Removing Walk: %s", nodeP.name);
	int pos = [self getNodePosition:nodeP];
	[nodeList removeObjectAtIndex:pos];
	return pos;
}

-(int) getNodePosition:(NodeData *) nodeP
{ 
	int i = 0;
	for (i =0; i< [nodeList count]; i++) {
		if([[[nodeList objectAtIndex:i] name] isEqualToString:[nodeP name]])
			return i;
	}
	return -1;
	
}


@end
