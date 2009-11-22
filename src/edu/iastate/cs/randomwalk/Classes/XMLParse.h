//
//  XMLParse.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLParse : NSObject {
	NSMutableString *currentElementValue;
	NSString *spaces;

}

-(void) startParsing;

@end
