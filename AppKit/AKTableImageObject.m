//
//  XTableImageObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "AKTableImageObject.h"
#import "AKTableImageCell.h"
#import "Global.h"

@implementation AKTableImageObject
@synthesize imageURL = _imageURL;

+ (Class)cellClass {
	return [AKTableImageCell class];
}

- (void)dealloc {
    RELEASE(_imageURL);
    [super dealloc];
}

@end
