//
//  XTableViewControlCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableViewControlCell.h"


@implementation XTableViewControlCell

- (void)setObject:(id)object {
	[super setObject:object];
	//XTableViewTextObject

	[self.contentView addSubview:object];
	//XTableViewTextObject *textObject = self.object;
//	self.textLabel.text = object.text;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	UIControl *control = self.object;
	control.frame = self.contentView.frame;
}

@end
