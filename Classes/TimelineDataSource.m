//
//  TimelineDataSource.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "TimelineDataSource.h"


@implementation TimelineDataSource

- (id)init {
    if (self = [super init]) {
        self.items = [NSArray arrayWithObjects:
                        [NSArray arrayWithObjects:
                         [AKTableTextObject itemWithText:@"Boo 1"],
                         [AKTableTextObject itemWithText:@"Boo 2"],
                         [AKTableTextObject itemWithText:@"Boo 3"],                         
                         nil],
                        nil];
    }
    return self;
}

- (void)modelDidFinishLoad:(AKModel *)model {
    //self.items = [NSArray array];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (AKTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AKTableTextObject itemWithText:@"Some item"];
}

@end
