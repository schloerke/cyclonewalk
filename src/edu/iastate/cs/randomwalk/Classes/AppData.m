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

@synthesize walkList, proximity, userWalks, defaultWalks, applicationSelectedWalks;


+(id) initSingleton
{
	NSLog(@"calling initSingleton");
	
	
	static AppData *singltonAppData;
	
	@synchronized(self) {
		if(!singltonAppData) {
 			singltonAppData = [[AppData alloc] init];
			
			NSLog(@"Initializing the AppData");
			singltonAppData.walkList = [[NSMutableArray alloc] init];
			singltonAppData.userWalks = [[NSMutableArray alloc] init];
			singltonAppData.defaultWalks = [[NSMutableArray alloc] init];
			singltonAppData.applicationSelectedWalks = [[NSMutableArray alloc] init];
			//singltonAppData.naviController = [[UINavigationController alloc] init];
			
			singltonAppData.proximity = 50;// feet
			
			
		}
	}
	
	return singltonAppData;
}

// adds a walk to the data
// walkP is of type walkData
-(int) addWalk:(WalkData *)walkP
{
	NSLog(@"Adding a walk with name: %@", walkP.name);
	
	[self.walkList addObject:walkP];
	
	if(walkP.favorite)
		[self.userWalks addObject:walkP];
	else {
		[self.defaultWalks addObject:walkP];
	}
	return [self getWalkPosition:walkP];
}

// walkP is of type WalkData
-(int) deleteWalk:(WalkData *)walkP
{
	NSLog(@"Removing Walk: %@", walkP.name);
	int pos = [self getWalkPosition:walkP];
	[self.walkList removeObjectAtIndex:pos];
	return pos;
}
	 
-(int) getWalkPosition:(WalkData *) walkP
{ 
	if (walkP.favorite) {
		int i = 0;
		for (i =0; i< [self.userWalks count]; i++) {
			if([[[self.userWalks objectAtIndex:i] name] isEqualToString:[walkP name]])
			{
				NSLog(@"User Walk at Pos: %d", i);
				return i;
			}
		}
		
	}
	else if(!walkP.favorite)
	{
		int i = 0;
		for (i =0; i< [self.defaultWalks count]; i++) {
			if([[[self.defaultWalks objectAtIndex:i] name] isEqualToString:[walkP name]])
			{
				NSLog(@"Default Walk at Pos: %d", i);
				return i;
			}
		}
		
	}
	
	
	
	
	
	int i = 0;
	for (i =0; i< [self.walkList count]; i++) {
		if([[[self.walkList objectAtIndex:i] name] isEqualToString:[walkP name]])
		{
			NSLog(@"Walk at Pos: %d", i);
			return i;
		}
	}
	
	NSLog(@"WALK NOT FOUND!");
	return -1;
	
}

// return a walk by a given name.  If not found, returns nil.
// @return WalkData
-(WalkData *) getWalkByName:(NSString *) name
{
	NSLog(@"GetwalkByName - 1");
	int i = 0;
	NSLog(@"GetwalkByName - 2");
	WalkData *tmpWalk;
	NSLog(@"GetwalkByName - 3");
	for (i = 0; i < [self.walkList count] ; i++) 
	{
		NSLog(@"GetwalkByName - 4");
		NSLog(@"Find Name: %@", name);
		NSLog(@"WalkListSize: %d", [walkList count]);

		NSUInteger pos;
		
		//		NSLog(@"i == %d", i);
		[self.walkList objectAtIndex:i];
		NSLog(@"GetwalkByName - 4a");
		pos = i;
		
		[self.walkList objectAtIndex:pos];

		NSLog(@"GetwalkByName - 4b");
		tmpWalk = [self.walkList objectAtIndex:pos];
		NSLog(@"WalkName: %@", tmpWalk.name);
		NSLog(@"%d",[name isEqualToString:tmpWalk.name]);
		NSLog(@"GetwalkByName - 5");
		if([name isEqualToString:tmpWalk.name])
		{
			NSLog(@"GetwalkByName - 6");
			NSLog(@"Returning Name: %@",  tmpWalk.name);
			NSLog(@"GetwalkByName - 7");
			[tmpWalk autorelease];
			NSLog(@"GetwalkByName - 8");
			return tmpWalk;
			NSLog(@"GetwalkByName - 9");
		}
		NSLog(@"GetwalkByName - 10");
	}
	NSLog(@"Failed to return a walk");
	return nil;
}

// return a list of walk names
// @return NSArray
-(NSArray *) getWalkNames:(BOOL)appWalk
{
	NSMutableArray* stringNames = [[NSMutableArray alloc] init];

	NSLog(@"Getting %@ walk names",(appWalk ? @"User Favorite" : @"Application Default") );
	
	int i = 0;
	WalkData *tmpWalk;
	NSLog(@"Walk Count: %d", [walkList count]);
	for (i = 0; i < [walkList count] ; i++) {
		NSLog(@"Getting Walk at Pos: %d", i);
		tmpWalk = [walkList objectAtIndex:i];
		
		NSLog(@"Walk Name: %@ Favorite: %@", tmpWalk.name, (tmpWalk.favorite ? @"YES" : @"NO"));
		NSLog(@"Equal: %d", tmpWalk.favorite == appWalk);
		if (tmpWalk.favorite == appWalk ) {
			[stringNames addObject:tmpWalk.name];
		}
	}
	
	//	[tmpWalk release];
	
	for (i =0; i<[stringNames count]; i++) {
		NSLog(@"String Name at %d: %@", i, [stringNames objectAtIndex:i]);
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
