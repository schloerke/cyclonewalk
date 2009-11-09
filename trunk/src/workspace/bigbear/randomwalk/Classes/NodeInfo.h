//
//  NodeDetail.h
//  randomwalk
//
//  Created by Barret Schloerke on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NodeInfo : UITableViewController {
	NodeData *nodeData;
}


/* 
 Initializes the view and objects with the node information.
 */
-(void) initWithNode:(NodeData *)nodeDataP;

/*
 Initializes the view with blank information
 */
-(void) initNewNode;


/*
 If the node detail view was initialized with a node, when the view disappears, the said node's info will be replaced.
 */
-(void) replaceNodeInfo;

/*
 If the node detail view was NOT initialized with a node, when the view disappears, a new node will be added to the node data.
 */
-(void) addNewNode;





@end
