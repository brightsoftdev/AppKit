//
//  BaseViewController.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "AKBaseViewController.h"
#import "XNavigationController.h"

@implementation AKBaseViewController

+ (AKBaseViewController *)push {
    AKBaseViewController *controller = [[self alloc] initWithNibName:nil bundle:nil];
    [[XNavigationController shared] pushViewController:controller animated:YES];

    return controller;
}

- (AKBaseViewController *)push {
    [[XNavigationController shared] pushViewController:self animated:YES];
    return self;
}

- (id)init {
	if (self = [self initWithNibName:nil bundle:nil]) {

	}
	
	return self;
}

- (void)loadView {
	// do nothing, well we should set the self.view
	UIView *v = [[[UIView alloc] init] autorelease];
	v.backgroundColor = [UIColor whiteColor];
	//v.layer.borderColor = [UIColor greenColor].CGColor;
	//v.layer.borderWidth = 6.0;

	self.view = v;
}

@end
