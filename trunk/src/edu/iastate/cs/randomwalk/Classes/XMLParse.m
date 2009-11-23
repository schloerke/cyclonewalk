//
//  XMLParse.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "XMLParse.h"


@implementation XMLParse

@synthesize inNode, nodeName, nodeDescription, nodeAddress, nodePhoneNumber, nodeLatitude, nodeLongitude, nodePhoto, nodeContactInfo, nodeProximity, inWalk, walkName, walkColor, walkFavorite, walkSelected, walkProximity;


- (AppData *)startParsing {
	//	NSURL *url = [[NSURL alloc] initWithString:@"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
	//NSURL *url = [[NSURL alloc] initWithString:@"http://www.barretschloerke.com/ComS309/buildings.xml"];
	NSURL *url = [[NSURL alloc] initWithString:@"http://www.barretschloerke.com/ComS309/buildingsSmall.xml"];
	
	appData = [[AppData alloc] initSingleton];

    NSXMLParser *parser = [[[NSXMLParser alloc] initWithContentsOfURL:url] autorelease];
    [parser setDelegate:self];
    [parser parse];
	
	int i, j;
	WalkData *tmpWalk;

	// REMOVE LATER!!!
	tmpWalk = [appData.walkList objectAtIndex:1];
	tmpWalk.favorite = YES;
	
	
	for (i = 0; i < [appData.walkList count]; i++) 
	{
		tmpWalk = [appData.walkList objectAtIndex:i];
		if(!tmpWalk.favorite)
			NSLog(@"App Walk: %@", tmpWalk.name);
		else {
			NSLog(@"User Walk: %@", tmpWalk.name);
		}

		
		NSLog(@"walkSize: %d", [tmpWalk.nodeList count]);
		
		for(j = 0; j < [tmpWalk.nodeList count]; j++)
		{
			NSLog(@"  Node: %@", [[tmpWalk.nodeList objectAtIndex:j] name]);
		}
	}
	
	
	return appData;
	
}

- (void)parser:(NSXMLParser *)parser 
	didStartElement:(NSString *)elementName 
	namespaceURI:(NSString *)namespaceURI 
	qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if(!spaces) 
		spaces = [[NSString alloc] init];
	else
		spaces = [spaces stringByAppendingString:@"  "];
    NSLog(@"%@Started %@", spaces, elementName);
	
	
	if(inWalk)
	{
		if([elementName isEqualToString:@"Name"])
		   walkName = YES;

		if([elementName isEqualToString:@"proximity"])
			walkProximity = YES;
		
		if([elementName isEqualToString:@"color"])
			walkColor = YES;
		
		if(inNode)
		{
			if([elementName isEqualToString:@"title"])
				nodeName = YES;
			if([elementName isEqualToString:@"description"])
				nodeDescription = YES;
			if([elementName isEqualToString:@"address"])
				nodeAddress = YES;
			if([elementName isEqualToString:@"phone"])
				nodePhoneNumber = YES;
			if([elementName isEqualToString:@"latitude"])
				nodeLatitude = YES;
			if([elementName isEqualToString:@"longitude"])
				nodeLongitude = YES;
			if([elementName isEqualToString:@"photo"])
				nodePhoto = YES;
			if([elementName isEqualToString:@"contact"])
				nodeContactInfo = YES;
			if([elementName isEqualToString:@"proximity"])
				nodeProximity = YES;
		}
		
		
		if([elementName isEqualToString:@"Node"])
		{
			inNode = YES;
			node = [[NodeData alloc] initNewNode];

		}

	}
	
	if([elementName isEqualToString:@"Walk"])
	{	
		inWalk = YES;
		walk = [[WalkData alloc] initNewWalk];
		
	}
	
	
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName
{

    NSLog(@"%@Ending %@", spaces, elementName);
	if([spaces length] <= 2)
		spaces = @"";
	else
		spaces = [spaces substringToIndex:[spaces length]-2 ];
	
	[currentElementValue release];
	currentElementValue = nil;
	
	if(inWalk)
	{
		if([elementName isEqualToString:@"Name"])
			walkName = NO;
		
		if([elementName isEqualToString:@"proximity"])
			walkProximity = NO;
		
		if([elementName isEqualToString:@"color"])
			walkColor = NO;
		
		if(inNode)
		{
			if([elementName isEqualToString:@"title"])
				nodeName = NO;
			if([elementName isEqualToString:@"description"])
				nodeDescription = NO;
			if([elementName isEqualToString:@"address"])
				nodeAddress = NO;
			if([elementName isEqualToString:@"phone"])
				nodePhoneNumber = NO;
			if([elementName isEqualToString:@"latitude"])
				nodeLatitude = NO;
			if([elementName isEqualToString:@"longitude"])
				nodeLongitude = NO;
			if([elementName isEqualToString:@"photo"])
				nodePhoto = NO;
			if([elementName isEqualToString:@"contact"])
				nodeContactInfo = NO;
			if([elementName isEqualToString:@"proximity"])
				nodeProximity = NO;
		}
		
		
		if([elementName isEqualToString:@"Node"])
		{
			inNode = NO;
			[walk addNode:node];
			
			[node release];
			//node = nil;
 		}
	}
	
	if([elementName isEqualToString:@"Walk"])
	{
		NSLog(@"Running script to add walk");
		inWalk = NO;
		[appData addWalk:walk];
		
		[walk release];
		//walk = nil;

	}
	
	
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	
	string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]	;
	
	
	if(currentElementValue == nil) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
	{
		[currentElementValue appendString:string];
		NSLog(@"  %@Processing Value: %@", spaces, currentElementValue);
		
		if(inWalk)
		{
			if(walkName)
				walk.name = currentElementValue;
			
			if(walkProximity)
				walk.proximity = [currentElementValue floatValue];
			
			if(walkColor)
			{	
				// Separate into r, g, b substrings  000,000,000
				NSRange range;  
				range.location = 0;  
				range.length = 2; 
				
				NSString *rString = [currentElementValue substringWithRange:range];  
				
				range.location = 2;  
				NSString *gString = [currentElementValue substringWithRange:range];  
				
				range.location = 4;  
				NSString *bString = [currentElementValue substringWithRange:range];  
				
				// Scan values  
				unsigned int r, g, b;  
				[[NSScanner scannerWithString:rString] scanHexInt:&r];  
				[[NSScanner scannerWithString:gString] scanHexInt:&g];  
				[[NSScanner scannerWithString:bString] scanHexInt:&b];  
				
				walk.color = [UIColor colorWithRed:((float) r / 255.0f)  
									   green:((float) g / 255.0f)  
										blue:((float) b / 255.0f)  
									   alpha:1.0f];  
				
				
				
			}
			
			if(inNode)
			{
				if(nodeName)
					node.name = currentElementValue;
				if(nodeDescription)
					node.description = currentElementValue;
				if(nodeAddress)
					node.address = currentElementValue;
				if(nodePhoneNumber)
					node.phoneNumber;
				if(nodeLatitude)
					node.latitude = [currentElementValue floatValue];
				if(nodeLongitude)
					node.longitude = [currentElementValue floatValue];
				if(nodePhoto)
					node.photoURL = [[NSURL alloc] initWithString:currentElementValue];
				if(nodeContactInfo)
					node.contactInfo = currentElementValue;
				if(nodeProximity)
					node.proximity;
			}
			
			
			if(inNode)
				; // do nothing
		}
		
		if(inWalk)
			; // do nothing
		
		
		
	}
	
	
	
}





@end
