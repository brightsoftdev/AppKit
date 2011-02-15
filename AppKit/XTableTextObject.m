//
//  XTableViewTextObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableTextObject.h"
#import "XTableTextCell.h"
#import "Global.h"

@implementation XTableTextObject

@synthesize text = _text;

+ (Class)cellClass {
	return [XTableTextCell class];
}

+ (id)itemWithText:(NSString *)text {
	XTableTextObject *object = [[[[self class] alloc] init] autorelease];
	object.text = text;
	return object;
}

- (void)dealloc {
	RELEASE(_text);
	[super dealloc];
}

@end
