//
//  NodeData.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeData.h"


@implementation NodeData

@synthesize name, description, address, phoneNumber, latitude, longitude, photo, contactInfo, proximity, photoURL;

-(UIImage *) getPhoto
{
	if(self.photo == nil)
	{	
		NSData *data = [NSData dataWithContentsOfURL:self.photoURL];
		return [[UIImage alloc] initWithData:data];
	}
	
	return self.photo;
	
}

-(void) setPhoneNum:(NSString *)phoneNumberString
{
	self.phoneNumber = [NSURL URLWithString:phoneNumberString];
}

-(id) initNewNode
{
	self.name = @"";
	self.description = @"";
	self.address = @"";
	self.phoneNumber = nil;
	self.latitude = 0;
	self.longitude = 0;
	self.photo = nil;
	self.photoURL = nil;
	self.contactInfo = @""; // person to call, minus the phone number
	self.proximity = 0;
	
	return self;
	
}

@end
