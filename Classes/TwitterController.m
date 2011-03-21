//
//  TwitterController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "TwitterController.h"
#import "AKLoadingView.h"

#import "TimelineDataSource.h"

@implementation TwitterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = @"Twitter Sample";
        //self.style = UITableViewStyleGrouped;
        self.dataSource = [[[TimelineDataSource alloc] init] autorelease];

        _model = [[PublicTimelineModel alloc] init];
        [_model.delegates addObject:self.dataSource];
        [_model.delegates addObject:self];
        
        [_model load];
    }
    return self;
}

- (void)dealloc {
    RELEASE(_model)
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    //self.dataSource = [[[TimelineDataSource alloc] init] autorelease];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.tableView.hidden = YES;

    self.overlayView = [[[AKLoadingView alloc] initWithFrame:self.view.frame] autorelease];
}

- (void)modelDidFinishLoad:(AKModel *)model {
    NSLog(@"modelDidFinishLoad : %@", model);
    [self.tableView reloadData];
    self.overlayView = nil;
}

@end
