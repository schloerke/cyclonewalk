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
	IBOutlet UITextView *phoneNumberT;
	IBOutlet UILabel *latitude;
	IBOutlet UILabel *longitude;
	IBOutlet UILabel *contactInfo;
	IBOutlet UIImage *photo;
	IBOutlet UIImageView *photoView;

	IBOutlet UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) NodeData *nodeData;




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
//-(IBAction) makeCall;

/*
 * Resizes and crops image to fit into the Detail View's image frame. Can be uses by external classes too
 */
+(UIImage*) cropAndResizeImage:(UIImage *)imageP toSize:(CGSize)targetSize;

@end
