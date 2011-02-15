//
//  TweetObject.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "TweetObject.h"


@implementation TweetObject
@synthesize text = _text;

- (void)dealloc {
    RELEASE(_text)
    [super dealloc];
}

@end
