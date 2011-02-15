//
//  XTableImageCell.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKImageView.h"
#import "XTableTextCell.h"

@interface XTableImageCell : XTableTextCell {
    AKImageView *_imageView2;
}

@property (nonatomic, readonly) AKImageView *imageView2;

@end
