//
//  NodeDetail.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/24/09.
//  Copyright 2009 CS 309 Group 8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NodeData.h"


@interface NodeDetail : UIViewController {
	NodeData *nodeData;
	
	IBOutlet UILabel *name;
	IBOutlet UITextView *description;
	IBOutlet UILabel *address;
	IBOutlet UIButton *phoneNumber;
	IBOutlet UILabel *latitude;
	IBOutlet UILabel *longitude;
	IBOutlet UILabel *contactInfo;
	IBOutlet UIImage *photo;
	IBOutlet UIImageView *photoView;
}

@property (nonatomic, retain) NodeData *nodeData;

/*@property (nonatomic, retain) UILabel *name;
 @property (nonatomic, retain) UILabel *description;
 @property (nonatomic, retain) UILabel *address;
 @property (nonatomic, retain) UILabel *phoneNumber;
 @property (nonatomic, retain) UILabel *contactInfo;
 @property (nonatomic, retain) UILabel *latitude;
 @property (nonatomic, retain) UILabel *longitude;
 @property (nonatomic, retain) UIImage *photo;
 */


/* 
 Initializes the view and objects with the node information.
 */
-(id) initWithNode:(NodeData *)nodeDataP;

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


-(void) setPhotoImage;
-(IBAction) makeCall;

@end
