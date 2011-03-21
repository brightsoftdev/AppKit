//
//  AKLoadingView.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "AKLoadingView.h"
#import "Additions.h"

@implementation AKLoadingView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor whiteColor];

        _loadingLabel = [[[AKLoadingLabel alloc] initWithFrame:CGRectZero] autorelease];
        _loadingLabel.text = LOCSTR(@"Loading...");
        [self addSubview:_loadingLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_loadingLabel sizeToFit];

    _loadingLabel.y = self.height / 2 - _loadingLabel.height / 2;
    _loadingLabel.x = self.width / 2 - _loadingLabel.width / 2;
}

@end
