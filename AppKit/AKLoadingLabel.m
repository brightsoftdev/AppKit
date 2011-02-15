//
//  AKLoadingLabel.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "AKLoadingLabel.h"
#import "Additions.h"

static const float kSpacing = 8.0;

@implementation AKLoadingLabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
        [self addSubview:_label];

        _activityIndicatorView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        [_activityIndicatorView sizeToFit];
        [_activityIndicatorView startAnimating];
        [self addSubview:_activityIndicatorView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    _activityIndicatorView.origin = CGPointMake(0, 0);
    _label.x = _activityIndicatorView.width + kSpacing;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(_activityIndicatorView.width + kSpacing + _label.width, _activityIndicatorView.height);
}

- (void)setText:(NSString *)value {
    _label.text = value;
    [_label sizeToFit];
}

- (NSString *)text {
    return _label.text;
}

@end
