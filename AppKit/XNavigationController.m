//
//  XNavigationController.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/10.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "Additions.h"
#import "XNavigationController.h"

@implementation XNavigationController

+ (XNavigationController *) shared{
    static XNavigationController *instance = NULL;
    if (!instance) {
        instance = [[self alloc] initWithNibName:nil bundle:nil];
    }
    return instance;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
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
/*
 [UIView beginAnimations:nil context:NULL];
 [UIView setAnimationDuration: 0.50];
 
 
 [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
 
 //Create ViewController
 MyViewController *myVC = [[MyViewController alloc] initWith...];
 
 [self.navigationController pushViewController:myVC animated:NO];
 [myVC release];
 
 //Start Animation
 [UIView commitAnimations];
 */

/*
 
 - (UINavigationController *)navigationController {
 if (!_navigationController) {
 TestController1 *controller = [[[TestController1 alloc] init] autorelease];
 _navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
 
 }
 return _navigationController;
 }
 
 */

@end
