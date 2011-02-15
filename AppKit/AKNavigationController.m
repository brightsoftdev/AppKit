//
//  XNavigationController.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/10.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "Additions.h"
#import "AKNavigationController.h"

@implementation AKNavigationController
@synthesize window = _window;

+ (AKNavigationController *) shared{
    static AKNavigationController *instance = NULL;
    if (!instance) {
        instance = [[self alloc] initWithNibName:nil bundle:nil];
    }
    return instance;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    /*
     * If no window, create.
     */
    if (!_window) {
        [self.window addSubview:self.view];
        [self.window makeKeyAndVisible];
    }

    if (animated) {
        //self.view.y = self.view.frame.size.height;
        /*
        [UIView beginAnimations:nil context:NULL]; {
            //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:0.8];
            //self.view.y = 0;
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        } [UIView commitAnimations];
        */
        [super pushViewController:viewController animated:YES];

    } else {
        
        [super pushViewController:viewController animated:NO];
    }

}

#pragma mark -
#pragma mark lazy

- (UIWindow *)window {
	if (!_window) {
		_window = [[UIWindow alloc] initWithFrame:AKScreenBounds()];
		_window.backgroundColor = [UIColor blackColor];
		//_window.layer.borderColor = [UIColor blueColor].CGColor;
		//_window.layer.borderWidth = 2.0;
	}
	return _window;
}


@end
