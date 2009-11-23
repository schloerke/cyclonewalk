//
//  WalkData.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeData.h"


@interface WalkData : NSObject {
	
	NSMutableArray *nodeList;
	
	NSString *name;
	UIColor *color;
	BOOL	favorite;
	BOOL	selected;
	CGFloat proximity;

}

-(int) addNode:(NodeData *)nodeP;

-(int) deleteNode:(NodeData *)nodeP;

-(int) getNodePosition:(NodeData *) nodeP;

-(id) initNewWalk;

-(void) select;
-(void) deselect;

@property (nonatomic, retain) NSMutableArray *nodeList;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic) BOOL favorite;
@property (nonatomic) BOOL selected;
@property (nonatomic) CGFloat proximity;


@end
