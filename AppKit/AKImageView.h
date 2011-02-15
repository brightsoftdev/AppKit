//
//  XImageView.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XURLRequest.h"

@interface AKImageView : UIView <XURLRequestDelegate> {
    UIActivityIndicatorView *_activityIndicatorView;
    UIImageView *_defaultImageView;
    UIImageView *_imageView;
    NSString *_imageURL;
    //UIImage *_defaultImage;
    XURLRequest *_request;
}

@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, copy) NSString *imageURL;

@end
