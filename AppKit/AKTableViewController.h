//
//  XTableViewController.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppKit.h"
#import "AKBaseViewController.h"

@interface AKTableViewController : UITableViewController {
	UITableViewStyle _style;
	//UITableView *_tableView;
}

@property (nonatomic, assign) UITableViewStyle style;
//@property (nonatomic, readonly) UITableView *tableView;

@end
