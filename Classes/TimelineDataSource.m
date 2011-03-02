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
        _publicTimelineModel = [[PublicTimelineModel alloc] init];
        /*
        self.items = [NSArray arrayWithObjects:
                        [NSArray arrayWithObjects:
                         [AKTableTextObject itemWithText:@"Boo 1"],
                         [AKTableTextObject itemWithText:@"Boo 2"],
                         [AKTableTextObject itemWithText:@"Boo 3"],                         
                         nil],
                        nil];
         */
    }
    return self;
}

- (void)dealloc {
    RELEASE(_publicTimelineModel)
    [super dealloc];
}

- (id <AKModelProtocol>) model{
    return _publicTimelineModel;
}

- (void)modelDidFinishLoad:(AKModel *)model {
    //self.items = [NSArray array];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _publicTimelineModel.tweets.count;
}

- (AKTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AKTableTextObject itemWithText:@"Some item"];
}

@end
