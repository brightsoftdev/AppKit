//
//  XTableViewObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableObject.h"
#import "XTableCell.h"
#import "XTableViewDataSource.h"

@implementation XTableObject
@synthesize enabled = _enabled;
@synthesize delegate = _delegate;
@synthesize selector = _selector;
@synthesize tableView = _tableView;

+ (Class)cellClass {
	return [XTableCell class];
}

- (id)init {
	if (self = [super init]) {
		self.enabled = YES;
	}
	return self;
}

- (void)update {
	NSIndexPath *indexPath = [(XTableViewDataSource *)_tableView.dataSource tableView:_tableView indexPathForObject:self];
	UITableViewCell *cell = [(XTableViewDataSource *)_tableView.dataSource tableView:_tableView cellForRowAtIndexPath:indexPath];
	//[cell setNeedsLayout];
	[_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
	[cell setSelected:YES animated:YES];
}

@end
