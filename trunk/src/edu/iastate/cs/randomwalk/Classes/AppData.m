//
//  AppData.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppData.h"
#import	"WalkData.h"


@implementation AppData


-(void) initSingleton
{
	if (self != nil) {
		NSLog(@"Initializing the AppData");
		//init
	}
}

// adds a walk to the data
// walkP is of type walkData
-(int) addWalk:(WalkData *)walkP
{
	NSLog(@"Adding a walk with name: %s", walkP.name);
	[walkList addObject:walkP];
	return [self getWalkPosition:walkP];
}

// walkP is of type WalkData
-(int) deleteWalk:(WalkData *)walkP
{
	NSLog(@"Removing Walk: %s", walkP.name);
	int pos = [self getWalkPosition:walkP];
	[walkList removeObjectAtIndex:pos];
	return pos;
}
	 
-(int) getWalkPosition:(WalkData *) walkP
{ 
	int i = 0;
	for (i =0; i< [walkList count]; i++) {
		if([[[walkList objectAtIndex:i] name] isEqualToString:[walkP name]])
			return i;
	}
	return -1;
	
}

// return a walk by a given name.  If not found, returns nil.
// @return WalkData
-(WalkData *) getWalkByName:(NSString *) name
{
	int i = 0;
	WalkData *tmpWalk;
	WalkData *returnWalk;
	for (i = 0; i < [walkList count] ; i++) {
		tmpWalk = [walkList objectAtIndex:i];
		if([name isEqualToString:tmpWalk.name])
			returnWalk = tmpWalk;
	}
	
	[tmpWalk release];
	
	NSLog(@"Returning Name: %s",  returnWalk.name);
	
	[returnWalk autorelease];
	return returnWalk;
}

// return a list of walk names
// @return NSArray
-(NSArray *) getWalkNames
{
	NSMutableArray* stringNames = [[NSMutableArray alloc] init];
	
	int i = 0;
	WalkData *tmpWalk;
	for (i = 0; i < [walkList count] ; i++) {
		tmpWalk = [walkList objectAtIndex:i];
		[stringNames addObject:tmpWalk.name];
	}
	
	[tmpWalk release];
	
	for (i =0; i<[stringNames count]; i++) {
		NSLog(@"Sting Name at %d: %s", i, [stringNames objectAtIndex:i]);
	}
	
	
	[stringNames autorelease];
	return stringNames;
}

-(NSInteger) getTotalWalkCount{
	NSInteger count = [walkList count];
	NSLog(@"Total Walk Count: %d", count);
	return count;
}

-(NSInteger) getUserWalkCount{
	int i = 0;
	int count = 0;
	for (i = 0; i < [walkList count]; i++) {
		
		if ([[walkList objectAtIndex:i] favorite]) {
			count++;
		}
	}
	NSInteger countNS = count;
	NSLog(@"Favorite Walk Count: %d", count);
	return countNS;
}

-(NSInteger) getAppWalkCount{
	NSInteger count = [self getTotalWalkCount] - [self getUserWalkCount];
	NSLog(@"Default Walk Count: %d", count);
	return count;
}




@end
