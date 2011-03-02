//
//  XTableViewController.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppKit.h"
#import "AKBaseViewController.h"
//#import <UIKit/UIKit.h>

@interface AKTableViewController : AKBaseViewController {
    UITableViewStyle _style;
    UITableView *_tableView;

    id <UITableViewDataSource> _dataSource;
    id <UITableViewDelegate> _delegate;
}

@property (nonatomic, assign) UITableViewStyle style;
@property (nonatomic, retain) id <UITableViewDataSource> dataSource;
@property (nonatomic, retain) id <UITableViewDelegate> delegate;

@property (nonatomic, retain) UITableView *tableView;

@end
