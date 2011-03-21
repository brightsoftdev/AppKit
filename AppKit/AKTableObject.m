//
//  XTableViewObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableObject.h"
#import "AKTableCell.h"
#import "AKTableViewDataSource.h"

@implementation AKTableObject
@synthesize enabled = _enabled;
@synthesize delegate = _delegate;
@synthesize selector = _selector;
@synthesize tableView = _tableView;

+ (Class)cellClass {
    return [AKTableCell class];
}

- (id)init {
    if ((self = [super init])) {
        self.enabled = YES;
    }
    return self;
}

- (void)update {
    NSIndexPath *indexPath = [(AKTableViewDataSource *)_tableView.dataSource tableView:_tableView indexPathForObject:self];
    UITableViewCell *cell = [(AKTableViewDataSource *)_tableView.dataSource tableView:_tableView cellForRowAtIndexPath:indexPath];
    //[cell setNeedsLayout];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [cell setSelected:YES animated:YES];
}

@end
