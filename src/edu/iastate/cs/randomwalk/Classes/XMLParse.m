//
//  XMLParse.m
//  randomwalk
//
//  Created by Barret Schloerke on 11/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "XMLParse.h"


@implementation XMLParse


- (void)startParsing {
	NSURL *url = [[NSURL alloc] initWithString:@"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
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
	
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
	
	NSLog(@"  %@Processing Value: %@", spaces, currentElementValue);
	
}





@end
