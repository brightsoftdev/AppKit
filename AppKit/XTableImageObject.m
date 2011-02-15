//
//  XTableImageObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "XTableImageObject.h"
#import "XTableImageCell.h"
#import "Global.h"

@implementation XTableImageObject
@synthesize imageURL = _imageURL;

+ (Class)cellClass {
	return [XTableImageCell class];
}

- (void)dealloc {
    RELEASE(_imageURL);
    [super dealloc];
}

@end
