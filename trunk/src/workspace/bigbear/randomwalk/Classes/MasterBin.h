//
//  MasterBin.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MasterBin : NSObject {
	NSArray *masterBin;

}

-(BOOL) addWalk:(id)walkP;

-(BOOL) deleteWalk:(id)walkP;


@end
