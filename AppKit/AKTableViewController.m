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
@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;
//@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //NSLog(@"TVC initWithNibName");
		self.style = UITableViewStylePlain;
        
    }
    return self;
}

- (void)dealloc {
    RELEASE(_dataSource);
    RELEASE(_delegate);
	[super dealloc];
}

- (void)setDataSource:(id <UITableViewDataSource>)value {
    self.tableView.dataSource = value;
    [_dataSource release];
    _dataSource = [value retain];
}

- (void)setDelegate:(id <UITableViewDelegate>)value {
    self.tableView.delegate = value;
    [_delegate release];
    _delegate = [value retain];
}

- (void)loadView {
	[super loadView];
	self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_style];
    self.delegate = [[[AKTableViewDelegate alloc] init] autorelease];
    self.dataSource = [[[AKTableViewGenericDataSource alloc] init] autorelease];
}

@end
