//
//  XTableViewCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableCell.h"
#import "XTableObject.h"
#import "Global.h"

@implementation XTableCell

@synthesize object = _object;
@synthesize enabled = _enabled;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		/*
		_enabled = YES;
		self.enabled = YES;
		*/
	}
	return self;
}

- (void)dealloc {
	RELEASE(_object);
	[super dealloc];
}

- (void)setObject:(id)object {
	RELEASE(_object);
	_object = [object retain];

	if ([object isKindOfClass:[XTableObject class]]) {
		XTableObject *tableObject = object;
		self.enabled = tableObject.enabled;
	}
	
//	self.textLabel.text = @"Omega";
}

- (void)setEnabled:(BOOL)value {
	//if (_enabled != value) {
		if (value) {
			self.selectionStyle = UITableViewCellSelectionStyleBlue;
			self.textLabel.textColor = [UIColor blackColor];
		} else {
			self.selectionStyle = UITableViewCellSelectionStyleNone;
			self.textLabel.textColor = [UIColor grayColor];
		}
	//}
	_enabled = value;
}

@end
