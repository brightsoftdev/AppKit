//
//  XNavigationController.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/10.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKNavigationController : UINavigationController {
    UIWindow *_window;
}

@property (nonatomic, readonly) UIWindow *window;

+ (AKNavigationController *)shared;

@end
