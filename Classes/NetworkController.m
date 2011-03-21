//
//  NetworkController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

#pragma mark -
#pragma mark actions

- (void)loadAction:(id)sender {
    AKURLRequest *request = [AKURLRequest requestWithURL:@"http://api.twitter.com/1/statuses/public_timeline.json" delegate:self];
    [request start];
}

#pragma mark -
#pragma mark delegate results

- (void)requestDidFinishLoading:(AKURLRequest *)request {
    NSString *responseString = [[[NSString alloc] initWithData:request.data encoding:NSUTF8StringEncoding] autorelease];
    id json = [responseString JSONValue];
    NSLog(@"response : %@", json);
}

#pragma mark -
#pragma mark controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = @"Network";
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    AKTableViewGenericDataSource *dataSource = self.dataSource;
    dataSource.items = [NSArray arrayWithObjects:
                        [AKTableTextObject itemWithText:@"Load From Twitter" delegate:self selector:@selector(loadAction:)],
                        nil];
}

@end
