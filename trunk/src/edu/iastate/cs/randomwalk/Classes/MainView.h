//
//  MainView.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainView : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	
	IBOutlet UIButton *selectAll;
	IBOutlet UIButton *unselectAll;
	IBOutlet UIButton *launch;
	NSArray *walks;
	IBOutlet UITableView *walkTableView;
}


- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath;


@end
