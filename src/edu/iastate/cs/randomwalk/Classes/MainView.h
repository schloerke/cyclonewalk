//
//  MainView.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainView : UIViewController {
	
	IBOutlet UIButton *selectAll;
	IBOutlet UIButton *unselectAll;
	IBOutlet UIButton *launch;
	NSArray *walks;

}



@end
