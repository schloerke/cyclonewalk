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
	NSURL *phoneNumber;
	NSString *phoneNumberString;
	CGFloat latitude;
	CGFloat	longitude;
	UIImage *photo;
	NSURL *photoURL;
	NSString *contactInfo; // person to call, minus the phone number
	CGFloat proximity;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSURL *phoneNumber;
@property (nonatomic, retain) NSString *contactInfo;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) CGFloat proximity;
@property (nonatomic, retain) UIImage *photo;
@property (nonatomic, retain) NSURL *photoURL;
@property (nonatomic, retain) NSString *phoneNumberString;

-(void) setPhoneNum:(NSString *)phoneNumberString;

-(UIImage *) getPhoto;   

-(id) initNewNode;


@end
