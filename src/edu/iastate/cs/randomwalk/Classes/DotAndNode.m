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

@implementation DotAndNode

@synthesize nodeData, xpos, ypos, color, radius;
@synthesize button, label;

const double PI = 3.141592;


-(id) initWithNode:(NodeData *)nodeP distanceInFeet:(CGFloat)distance color:(UIColor *) colorP xPos:(CGFloat)xposP yPos:(CGFloat)yposP
{
	
	self = [[DotAndNode alloc] init];
	self.nodeData = nodeP;
	self.xpos = xposP;
	self.ypos = yposP;
	
	self.color = colorP;
	
	CGSize textSize = [self.nodeData.name sizeWithFont:self.label.font];
	self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.xpos, self.ypos, textSize.width, textSize.height)];

	self.label.text = self.nodeData.name;
	
	self.button = [UIButton buttonWithType: UIButtonTypeInfoLight];
	[self.button setTitleColor:[UIColor whiteColor] forState:UIControlEventTouchUpInside];	
	[self.button setTitleShadowColor:[UIColor blackColor] forState:UIControlEventAllEvents];
		
	[self.button addTarget:self action:@selector(pushNodeDetail:) forControlEvents:UIControlEventTouchUpInside];
	
	
	
	
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button addTarget:self 
			   action:@selector(aMethod:)
	 forControlEvents:UIControlEventTouchDown];
	[button setTitle:@"Show View" forState:UIControlStateNormal];
	button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	
	
	//[view addSubview:self.button];
	
	return self;
}

-(void) pushNodeDetail:(id)sender
{
	NodeDetail *infoView = [[NodeDetail alloc] initWithNode:self.nodeData];
	
	NSLog(@"Pushing the NodeDetail: %@", infoView.nodeData.name);
	//[self.navigationController pushViewController:infoView animated:YES];
	//self.navigationController.navigationBarHidden = NO;
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
	
	CGContextClosePath (context);
	
	[self.color setFill]; 
	[self.color setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke);
	

	
	
}

@end
