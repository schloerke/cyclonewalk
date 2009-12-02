//
//  NodeData.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeData.h"


@implementation NodeData

@synthesize name, description, address, phoneNumber, latitude, longitude, photo, contactInfo, proximity, photoURL, phoneNumberString;

-(UIImage *) getPhoto
{
	NSLog(@"PhotoUrl: %@", [self.photoURL absoluteString]);
	NSData *data = [NSData dataWithContentsOfURL:self.photoURL];	
	UIImage *img = [[UIImage alloc] initWithData:data];
	[img autorelease];
	return img;
	/*
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:self.photoURL
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	// create the connection with the request
	// and start loading the data
	NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	NSMutableData *dataMuta;
	if (theConnection) {
		// Create the NSMutableData that will hold
		// the received data
		// receivedData is declared as a method instance elsewhere
		dataMuta=[[NSMutableData data] retain];
	} else {
		// inform the user that the download could not be made
	}
	
	UIImage *img = [[UIImage alloc] initWithData:data];
	[img autorelease];
	return img;
	*/
	
}

-(void) setPhoneNum:(NSString *)phoneNumberStringP
{
	self.phoneNumber = [NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNumberStringP]];
}

-(id) initNewNode
{
	
	self = [[NodeData alloc] init];
	
	self.name = @"<none>";
	self.description = @"<none>";
	self.address = @"<none>";
	self.phoneNumber = nil;
	self.phoneNumberString = @"<none>";
	self.latitude = 0;
	self.longitude = 0;
	self.photo = nil;
	self.photoURL = nil;
	self.contactInfo = @"<none>"; // person to call, minus the phone number
	self.proximity = -1;
	
	return self;
	
}

@end
