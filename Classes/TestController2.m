//
//  TestController2.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/10.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "TestController2.h"
#import "TableViewController1.h"

@implementation TestController2

- (void)nextAction:(id)sender {
    //[TestController2 push];
    //[[[[TestController2 alloc] initWithNibName:nil bundle:nil] autorelease] push];
    TableViewController1 *tableViewController = [[[TableViewController1 alloc] initWithNibName:nil bundle:nil] autorelease];
    [[AKNavigationController shared] pushViewController:tableViewController animated:YES];

    //[[[[TestController2 alloc] initWithTitle:[NSString stringWithFormat:@"R : %d", arc4random()]] autorelease] push];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"TestController2";
    }
    return self;
}

- (id)initWithTitle:(NSString *)title {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(nextAction:)];
}

@end
