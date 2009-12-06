//
//  CameraViewOverlay.m
//  randomwalk
//
//  Created by Owusu, Emmanuel K on 11/25/09.
//  Copyright 2009 Iowa State University. All rights reserved.
//

#import "CameraViewOverlay.h"


@implementation CameraViewOverlay

@synthesize navigation;

-(id) initWithNavigation:(CameraViewController *) navigationP
{
	self = [[CameraViewOverlay alloc] init];
	self.navigation = navigationP;
	
	return self;
}

-(void) addNode:(NodeData *) nodeP
{
	NSLog(@"Adding node to overlay: %@", nodeP.name);
	DotAndNode *dot = [[DotAndNode alloc] initWithNode:nodeP navigation:self.navigation distanceInFeet:100 color:[UIColor redColor] xPos:100 yPos:200];
	[self.view addSubview:dot.view];
	
	
	
	
	// create a UIButton (UIButtonTypeRoundedRect) and play arround with settings
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];   
	button.frame = CGRectMake(100, 100, 100, 50); // size and position of button
	[button setTitle:@"Add" forState:UIControlStateNormal];
	button.backgroundColor = [UIColor clearColor];
	button.adjustsImageWhenHighlighted = YES;    
	
	//Add action handler and set current class as target
	[button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	
	
	
	//[dot autorelease];
	
//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[button addTarget:self 
//			   action:@selector(aMethod:)
//	 forControlEvents:UIControlEventTouchDown];
//	[button setTitle:@"Show View" forState:UIControlStateNormal];
//	button.frame = CGRectMake(80.0, 310.0, 160.0, 40.0);
//	NSLog(@"adding tmp button");
//	[self addSubview:button];
//	[button release];
//	
//	UIButton *returnButton;
//	returnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[returnButton setTitle:@"Click here" forState:UIControlStateNormal];
//	returnButton.frame = CGRectMake( 100,50, 100, 50); // provides both a position and a size
//	[self addSubview:returnButton];
	
	
}

-(void)action:(id)sender
{
	NSLog(@"UIButton was clicked");
	//label.text = @"Bye World";
}

/*- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}*/


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
