//
//  XImageView.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AKURLRequest.h"

@interface AKImageView : UIView <AKURLRequestDelegate> {
    UIActivityIndicatorView *_activityIndicatorView;
    UIImageView *_defaultImageView;
    UIImageView *_imageView;
    NSString *_imageURL;
    //UIImage *_defaultImage;
    AKURLRequest *_request;
}

@property (nonatomic, retain) UIImage *defaultImage;
@property (nonatomic, copy) NSString *imageURL;

@end
