//
//  PublicTimelineModel.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "PublicTimelineModel.h"


@implementation PublicTimelineModel
@synthesize tweets = _tweets;

- (id)init {
    if (self = [super init]) {
        _tweets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    RELEASE(_tweets)
    [super dealloc];
}

- (void)load {
    //
}

@end
