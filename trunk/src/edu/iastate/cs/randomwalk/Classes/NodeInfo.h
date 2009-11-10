//
//  NodeDetail.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NodeInfo : UITableViewController {
	NSObject *nodeData;
	NSArray *viewArray;

	IBOutlet NSString *name;
	IBOutlet NSString *description;
	IBOutlet NSString *address;
	IBOutlet NSString *phoneNumber;
	IBOutlet CGFloat latitude;
	IBOutlet CGFloat	longitude;
	IBOutlet UIImage *photo;
	IBOutlet NSString *contactInfo;
	
	IBOutlet UIButton *imageButton;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *contactInfo;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic, retain) UIImage *photo;
@property (nonatomic, retain) NSArray *viewArray;



/* 
 Initializes the view and objects with the node information.
 */
-(id) initWithNode:(id)nodeDataP;

/*
 Initializes the view with blank information
 */
-(id) initNewNode;


/*
 If the node detail view was initialized with a node, when the view disappears, the said node's info will be replaced.
 */
-(void) replaceNodeInfo;

/*
 If the node detail view was NOT initialized with a node, when the view disappears, a new node will be added to the node data.
 */
-(void) addNewNode;





@end
