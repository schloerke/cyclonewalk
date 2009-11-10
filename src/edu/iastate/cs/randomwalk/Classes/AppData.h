//
//  AppData.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppData : NSObject {
	NSArray *walkList;
	
	// All global settings
	CGFloat proximity;

	
}


//
-(BOOL) addWalk:(id)walkP;

//
-(BOOL) deleteWalk:(id)walkP;


@end
