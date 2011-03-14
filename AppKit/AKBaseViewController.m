//
//  BaseViewController.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Global.h"
#import "AKBaseViewController.h"
#import "AKNavigationController.h"

@implementation AKBaseViewController
@synthesize overlayView = _overlayView;

- (void)loadView {
    // do nothing, well we should set the self.view
    UIView *v = [[[UIView alloc] init] autorelease];
    v.backgroundColor = [UIColor whiteColor];
    //v.layer.borderColor = [UIColor greenColor].CGColor;
    //v.layer.borderWidth = 6.0;

    self.view = v;
}

- (void)dealloc {
    RELEASE(_overlayView)
    [super dealloc];
}

// need to release overlayview !

- (void)setOverlayView:(UIView *)value {
    if (value) {
        value.frame = self.view.frame;
        [self.view addSubview:value];
    }

    [_overlayView removeFromSuperview];
    [_overlayView release];
    _overlayView = [value retain];
}

@end
