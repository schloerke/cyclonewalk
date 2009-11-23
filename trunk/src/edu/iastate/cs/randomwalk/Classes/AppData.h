//
//  AppData.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalkData.h"


@interface AppData : NSObject {
	NSMutableArray *walkList;
	
	// All global settings
	CGFloat proximity;

	
}

@property (nonatomic, retain) NSMutableArray *walkList;
@property (nonatomic) CGFloat proximity;

// init method
-(id) initSingleton;

// adds a walk to the data
// walkP is of type walkData
// @return position added
-(int) addWalk:(WalkData *)walkP;

// walkP is of type WalkData
// @return position of walk
-(int) deleteWalk:(WalkData *)walkP;

// return a walk by a given name.  If not found, returns nil.
// @return WalkData*
-(WalkData *) getWalkByName:(NSString *) name;

// return a list of walk names
-(NSArray *) getWalkNames:(BOOL)select;

// return the position of the walk
-(int) getWalkPosition:(WalkData *) walkP;

-(NSInteger) getTotalWalkCount;	// all count
-(NSInteger) getUserWalkCount;	// user favorites
-(NSInteger) getAppWalkCount;	// predefined




@end
