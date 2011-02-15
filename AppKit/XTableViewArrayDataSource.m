//
//  XTableViewArrayDataSource.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XTableViewArrayDataSource.h"
#import "Global.h"

@class XTableObject;
@implementation XTableViewArrayDataSource
@synthesize items = _items;

- (void)dealloc {
	RELEASE(_items);
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _items.count;
}

- (XTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [_items objectAtIndex:indexPath.row];
}

@end
