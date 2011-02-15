//
//  XTableImageCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "XTableImageCell.h"
#import "XTableImageObject.h"
#import "Additions.h"
#import "Global.h"

@implementation XTableImageCell

- (void)dealloc {
    RELEASE(_imageView2);
    [super dealloc];
}

- (void)setObject:(XTableImageObject *)object {
	[super setObject:object];
	self.textLabel.text = object.imageURL;
    self.imageView2.imageURL = object.imageURL;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.textLabel.x += 50;
    self.textLabel.width -= 50;

    self.imageView2.frame = CGRectMake(0, 0, 50, 50);
}

- (XImageView *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [[XImageView alloc] init];
        _imageView2.defaultImage = [UIImage imageNamed:@"test"];
        [self.contentView addSubview:_imageView2];
    }
    return _imageView2;
}

@end
