//
//  DescriptionDialog.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DescriptionDialog : UIViewController {
	NSString *string;
}


/*
 The walk data contains a field that has a description or instructions about the walk.  This initializes the Description Dialog with the supplied text and is displayed.
 */
-(void) initWithText:(NSString *)text;



@end
