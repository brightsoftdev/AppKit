//
//  XTableViewTextCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableTextCell.h"
#import "XTableTextObject.h"

@implementation XTableTextCell
//@dynamic object;

- (void)setObject:(XTableTextObject *)object {
	[super setObject:object];
	self.textLabel.text = object.text;
}

@end

