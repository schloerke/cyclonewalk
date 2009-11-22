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


- (void)startParsing {
	//	NSURL *url = [[NSURL alloc] initWithString:@"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
	//NSURL *url = [[NSURL alloc] initWithString:@"http://www.barretschloerke.com/ComS309/buildings.xml"];
	NSURL *url = [[NSURL alloc] initWithString:@"http://www.barretschloerke.com/ComS309/buildingsSmall.xml"];

    NSXMLParser *parser = [[[NSXMLParser alloc] initWithContentsOfURL:url] autorelease];
    [parser setDelegate:self];
    [parser parse];
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
			
			if([elementName isEqualToString:@"Name"])
				nodeName = YES;
			BOOL nodeDescription;
			BOOL nodeAddress;
			BOOL nodePhoneNumber;
			BOOL nodeLatitude;
			BOOL nodeLongitude;
			BOOL nodePhoto;
			BOOL nodeContactInfo;
			BOOL nodeProximity;
			
			
			
		}
		
		
		if([elementName isEqualToString:@"Node"])
		   inNode = YES;
	}
	
	if([elementName isEqualToString:@"Walk"])
		inWalk = YES;
	
	
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
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	
	string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]	;
	
	
	if(currentElementValue == nil) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
	{
		[currentElementValue appendString:string];
		NSLog(@"  %@Processing Value: %@", spaces, currentElementValue);
	}
	
	
	
}





@end
