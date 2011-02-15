//
//  XTableImageCell.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XImageView.h"
#import "XTableTextCell.h"

@interface XTableImageCell : XTableTextCell {
    XImageView *_imageView2;
}

@property (nonatomic, readonly) XImageView *imageView2;

@end
