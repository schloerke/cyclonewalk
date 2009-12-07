//
//  DotAndNode.m
//  randomwalk
//
//  Created by Barret Schloerke on 12/1/09.
//  Copyright 2009 CS 309 Group 8. All rights reserved.
//

#import "DotAndNode.h"
#import "math.h"
#import "NodeDetail.h"
#import "Settings.h"

@implementation DotAndNode

@synthesize nodeData, xpos, ypos, color, radius;
@synthesize button, label;
@synthesize navigation;

const double PI = 3.141592;


-(id) initWithNode:(NodeData *)nodeP navigation:(CameraViewController *)navigationP distanceInFeet:(CGFloat)distance color:(UIColor *) colorP xPos:(CGFloat)xposP yPos:(CGFloat)yposP
{
	
	self = [[DotAndNode alloc] init];
	self.nodeData = nodeP;
	self.xpos = xposP;
	self.ypos = yposP;
	self.navigation = navigationP;
	
	self.color = colorP;
		
	self.button = [UIButton buttonWithType: UIButtonTypeInfoDark];
	[self.button setTitleColor:[UIColor whiteColor] forState:UIControlEventTouchUpInside];	
	[self.button setTitleShadowColor:[UIColor blackColor] forState:UIControlEventAllEvents];
	[self.button addTarget:self action:@selector(pushNodeDetail:) forControlEvents:UIControlEventTouchUpInside];
	self.button.frame = CGRectMake(self.xpos, self.ypos, self.button.frame.size.width, self.button.frame.size.height);
	
	//TODO: resize font size based on distanceInFeet
	CGFloat fontSize;
	CGFloat maxDistance = 1000;
	CGFloat maxFont = 60;
	CGFloat minFont = 6;
	if (distance>1000) {
		fontSize = 10;
	}
	else{
		fontSize = ((distance*(maxFont-minFont))/maxDistance) + minFont;
	}
	
	UIFont *labelFont = [UIFont systemFontOfSize:fontSize];
	CGSize textSize = [self.nodeData.name sizeWithFont:labelFont];
	NSLog(@"Label size: w:%d h:%d", textSize.width, textSize.height);
	self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.xpos + self.button.frame.size.width + 3, self.ypos - 2, textSize.width, textSize.height)];
	self.label.backgroundColor = colorP;
	self.label.text = [@" " stringByAppendingString:self.nodeData.name];
	self.label.font = labelFont;
	
	[self.view addSubview:self.button];
	[self.view addSubview:self.label];
	
	return self;
}

-(void) pushNodeDetail:(id)sender
{
	NodeDetail *infoView = [[NodeDetail alloc] initWithNode:self.nodeData];

	NSLog(@"Pushing the NodeDetail: %@", infoView.nodeData.name);
//	Settings *set = [[Settings alloc] initSettings];
//	UINavigationController *navi = [[UINavigationController alloc] init];
	[self.navigation.navigationController pushViewController:infoView animated:YES];
//	self.navigationController.navigationBarHidden = NO;
	[infoView release];
}


-(void) draw
{	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextBeginPath (context); 
	
	
	CGContextMoveToPoint(context, xpos + self.radius, ypos); 
	
	double deg;
	for (deg = 0; deg<=PI; deg+=PI/20) {
		CGContextAddLineToPoint(context, xpos + self.radius * cos(deg), self.radius * sin(deg));
	}
	[self.color setFill]; 
	[self.color setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke);
	
	CGContextClosePath (context);
//	
//	[self.color setFill]; 
//	[self.color setStroke]; 
//	CGContextDrawPath (context, kCGPathFillStroke);
}

@end
