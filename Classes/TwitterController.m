//
//  TwitterController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "TwitterController.h"
#import "AKLoadingView.h"

@implementation TwitterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Twitter Sample";
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)loadView {
    [super loadView];

    AKTableViewGenericDataSource *dataSource = self.dataSource;
    dataSource.items = [NSArray arrayWithObject:[AKTableTextObject itemWithText:@"Boo"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.tableView.hidden = YES;

    AKLoadingView *loadingView = [[[AKLoadingView alloc] initWithFrame:self.tableView.frame] autorelease];
    [self.tableView.superview addSubview:loadingView];
}

@end
