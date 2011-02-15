//
//  AKLoadingLabel.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLoadingLabel : UIView {
    UILabel *_label;
    UIActivityIndicatorView *_activityIndicatorView;
}

@property (nonatomic, copy) NSString *text;

@end
