//
//  DotAndNode.h
//  randomwalk
//
//  Created by Barret Schloerke on 12/1/09.
//  Copyright 2009 CS 309 Group 8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppData.h"
#import "CameraViewController.h"

@interface DotAndNode : UIViewController {
	NodeData *nodeData;
	UIButton *button;
	UILabel *label;
	
	UIColor *color;
	CGFloat radius;
	NSInteger ypos;
	NSInteger xpos;
	
	CameraViewController *navigation;

}

@property (nonatomic, retain) NodeData *nodeData;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic) NSInteger ypos;
@property (nonatomic) NSInteger xpos;
@property (nonatomic) CGFloat radius;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, retain) CameraViewController *navigation;


-(id) initWithNode:(NodeData *)nodeP navigation:(CameraViewController *)navigationP distanceInFeet:(CGFloat)distance color:(UIColor *) colorP xPos:(CGFloat)xposP yPos:(CGFloat)yposP;



@end
