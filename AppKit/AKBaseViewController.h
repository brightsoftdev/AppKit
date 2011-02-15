//
//  BaseViewController.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKBaseViewController : UIViewController {
    UIView *_overlayView;
}

@property (nonatomic, retain) UIView *overlayView;

@end
