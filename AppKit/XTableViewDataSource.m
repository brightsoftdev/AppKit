//
//  XTableViewDataSource.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableViewDataSource.h"
#import "XTableObject.h"
#import "XTableCell.h"

@implementation XTableViewDataSource

- (XTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;//[[[XTableViewObject alloc] init] autorelease];
}

- (NSIndexPath*)tableView:(UITableView*)tableView indexPathForObject:(id)object {
	return nil;
}

- (id)init {
	if (self = [super init]) {
		//
		//NSLog(@"DataSource");
	}
	return self;
}
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if (self.items) {
		<#statements#>
	}
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//
	XTableObject *object = [self tableView:tableView objectForRowAtIndexPath:indexPath];
	Class cellClass = [[object class] cellClass];

	NSString *identifier = NSStringFromClass(cellClass);
	XTableCell* cell = (XTableCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[[cellClass alloc] initWithStyle:UITableViewCellStyleDefault
								 reuseIdentifier:identifier] autorelease];
	}
	
	object.tableView = tableView;
	cell.object = object;
	//[self tableView:tableView cell:cell willAppearAtIndexPath:indexPath];

	return cell;
}

@end
