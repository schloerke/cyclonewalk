//
//  WalkData.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WalkData.h"




@implementation WalkData

@synthesize name, color, favorite, selected, proximity, nodeList;


-(void) select{
	self.selected = YES;
}
-(void) deselect{
	self.selected = NO;
}


-(id) initNewWalk
{
	self = [WalkData alloc];
	self.name = @"";
	self.color = nil;
	self.favorite = NO;
	self.selected = NO;
	self.proximity = -1;
	self.nodeList = [[NSMutableArray alloc] init];

	return self;
	
}

-(int) addNode:(NodeData *)nodeP
{
	NSLog(@"Adding a node with name: %@", nodeP.name);
	[self.nodeList addObject:nodeP];
	return [self getNodePosition:nodeP];
}

-(int) deleteNode:(NodeData *)nodeP
{
	NSLog(@"Removing Node: %@", nodeP.name);
	int pos = [self getNodePosition:nodeP];
	[self.nodeList removeObjectAtIndex:pos];
	return pos;
}


-(int) getNodePosition:(NodeData *) nodeP
{ 
	int i = 0;
	for (i =0; i< [nodeList count]; i++) {
		if([[[nodeList objectAtIndex:i] name] isEqualToString:[nodeP name]])
		{
			NSLog(@"Node found at Pos: %d", i);
			return i;
			
		}
	}
	NSLog(@"NODE NOT FOUND!");
	return -1;
	
}


@end
