//
//  XMLParse.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeData.h"
#import "WalkData.h"
#import "AppData.h"


@interface XMLParse : NSObject {
	AppData *appData;
	NSMutableString *currentElementValue;
	NSString *spaces;
	
	NodeData *node;
	BOOL inNode;
	BOOL nodeName;
	BOOL nodeDescription;
	BOOL nodeAddress;
	BOOL nodePhoneNumber;
	BOOL nodeLatitude;
	BOOL nodeLongitude;
	BOOL nodePhoto;
	BOOL nodeContactInfo;
	BOOL nodeProximity;
	
	WalkData *walk;
	BOOL inWalk;
	BOOL walkName;
	BOOL walkColor;
	BOOL walkFavorite;
	BOOL walkSelected;
	BOOL walkProximity;

}

-(AppData *) startParsing;

@property (nonatomic) BOOL  inNode;
@property (nonatomic) BOOL  nodeName;
@property (nonatomic) BOOL  nodeDescription;
@property (nonatomic) BOOL  nodeAddress;
@property (nonatomic) BOOL  nodePhoneNumber;
@property (nonatomic) BOOL  nodeLatitude;
@property (nonatomic) BOOL  nodeLongitude;
@property (nonatomic) BOOL  nodePhoto;
@property (nonatomic) BOOL  nodeContactInfo;
@property (nonatomic) BOOL  nodeProximity;

@property (nonatomic) BOOL  inWalk;
@property (nonatomic) BOOL  walkName;
@property (nonatomic) BOOL  walkColor;
@property (nonatomic) BOOL  walkFavorite;
@property (nonatomic) BOOL  walkSelected;
@property (nonatomic) BOOL  walkProximity;



@end





