//
//  WalkData.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WalkData : NSObject {
	
	NSArray *nodeList;
	
	NSString *name;
	UIColor *color;


}

-(BOOL) addNode:(id)nodeP;

-(BOOL) deleteNode:(id)nodeP;



@end
