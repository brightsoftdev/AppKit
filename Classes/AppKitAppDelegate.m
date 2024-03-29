//
//  iOSKitAppDelegate.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppKitAppDelegate.h"

#import "MenuController.h"
#import "TestController2.h"
#import "TwitterController.h"

#import "AKWebController.h"
#import "AKWebAppController.h"

@implementation AppKitAppDelegate

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    [MenuController push];
    //[AKWebAppController push];
    //[[[[AKWebAppController alloc] initWithInitialURL:@"http://localhost/SchoolApp/public_html/"] autorelease] push];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    //RELEASE(_window);
    //RELEASE(_navigationController);
    [super dealloc];
}


#pragma mark -
#pragma mark lazy
/*
- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:AKScreenBounds()];
        _window.backgroundColor = [UIColor blackColor];
        //_window.layer.borderColor = [UIColor blueColor].CGColor;
        //_window.layer.borderWidth = 2.0;
    }
    return _window;
}
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
