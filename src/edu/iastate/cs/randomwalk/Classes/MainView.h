//
//  MainView.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppData.h"
#import "MapViewController.h"
#import "CameraViewController.h"
#import "Settings.h"



@interface MainView : UIViewController <UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate> {
	
	IBOutlet UIButton *selectAll;
	IBOutlet UIButton *unselectAll;
	IBOutlet UIButton *launch;
	NSArray *walks;
	IBOutlet UITableView *walkTableView;
	AppData *appData;
}


@property (nonatomic, retain) NSArray *walks;
@property (nonatomic, retain) AppData *appData;


-(id)initWithAppData;
-(IBAction)selectAllRows;
-(IBAction)deselectAllRows;
-(IBAction)pushedStart;

/*- (void)walkTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)walkTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)walkTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)walkTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
 */


@end
