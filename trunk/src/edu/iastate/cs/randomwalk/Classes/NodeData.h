//
//  NodeData.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NodeData : NSObject {
	NSString *name;
	NSString *description;
	NSString *address;
	NSString *phoneNumber;
	CGFloat latitude;
	CGFloat	longitude;
	UIImage *photo;
	NSString *contactInfo; // person to call, minus the phone number
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *contactInfo;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic, retain) UIImage *photo;


		   

@end
