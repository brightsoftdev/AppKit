//
//  XTableViewController.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableViewController.h"
#import "AKTableViewDataSource.h"

@implementation AKTableViewController
@synthesize style = _style;
//@synthesize tableView = _tableView;


- (id)init {
	if (self = [super initWithNibName:nil bundle:nil]) {
		//
		_style = UITableViewStylePlain;
	}
	return self;
}

- (void)dealloc {
	//RELEASE(_tableView);
	[super dealloc];
}

- (void)loadView {
	[super loadView];
	self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_style];
}
/*
- (UITableView *)tableView {
	return (UITableView *)self.view;
}
*/
@end
