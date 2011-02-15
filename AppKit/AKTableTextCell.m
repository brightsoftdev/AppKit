//
//  XTableViewTextCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableTextCell.h"
#import "AKTableTextObject.h"

@implementation AKTableTextCell
//@dynamic object;

- (void)setObject:(AKTableTextObject *)object {
	[super setObject:object];
	self.textLabel.text = object.text;
}

@end

