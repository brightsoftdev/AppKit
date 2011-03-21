//
//  Controller.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuController.h"
#import "NetworkController.h"
#import "TwitterController.h"


@implementation MenuController

#pragma mark -
#pragma mark actions

- (void)webControllerAction:(id)sender {
    [[[[AKWebController alloc] initWithInitialURL:@"http://www.google.com/"] autorelease] push];
}

- (void)mapControllerAction:(id)sender {
    AKMapController *controller = [[[AKMapController alloc] initWithNibName:nil bundle:nil] autorelease];
    controller.title = @"My Map";
    [controller push];
}

- (void)nextAction:(id)sender {
    [[self class] push];
}

- (void)networkAction:(id)sender {
    [NetworkController push];
}

- (void)twitterAction:(id)sender {
    [TwitterController push];
}

- (void)objectAction:(AKTableTextObject *)tableObject {
    [UIAlertView showAlertWithMessage:@"You tapped me !"];
}


#pragma mark -
#pragma mark controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nil bundle:nil])) {
        self.title = @"AppKit Sample App";
        self.style = UITableViewStyleGrouped;
        
        //self.hidesBottomBarWhenPushed = YES;
        
        self.toolbarItems = [NSArray arrayWithObjects:
                             [[[UIBarButtonItem alloc] initWithTitle:@"Item 1" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease],
                             nil];
        
    }
    return self;
}

- (void)prepareDataSource {
    AKTableViewGenericDataSource *dataSource = [[[AKTableViewGenericDataSource alloc] init] autorelease];

    dataSource.sectionTitles = [NSArray arrayWithObjects:
                                @"Built-in Controllers",
                                @"",
                                @"Network",
                                @"Some section title",
                                nil];

    dataSource.sectionFooters = [NSArray arrayWithObjects:
                                 @"",
                                 @"",
                                 @"",
                                 @"This is some footer string. This is some footer string. This is some footer string.",
                                 @"Will push a new controller to navigation controller.",
                                 nil];

    dataSource.items = [NSArray arrayWithObjects:
                        
                        [NSArray arrayWithObjects:
                         [AKTableTextObject itemWithText:@"AKWebController" delegate:self selector:@selector(webControllerAction:)],
                         [AKTableTextObject itemWithText:@"AKMapController" delegate:self selector:@selector(mapControllerAction:)],
                         nil],
                        
                        //[[[AKTableColumnObject alloc] init] autorelease],

                        [NSArray arrayWithObjects:
                         [AKTableTextObject itemWithText:@"Twitter Sample" delegate:self selector:@selector(twitterAction:)],
                         [AKTableTextObject itemWithText:@"Network Controller" delegate:self selector:@selector(networkAction:)],
                         nil],

                        [AKTableTextObject itemWithText:@"Tap me" delegate:self selector:@selector(objectAction:)],

                        [NSArray arrayWithObjects:
                         [AKTableTextObject itemWithText:@"Item 1"],
                         [AKTableTextObject itemWithText:@"Item 2"],
                         [AKTableTextObject itemWithText:@"Item 3"],
                         nil],

                        [AKTableTextObject itemWithText:@"Next" delegate:self selector:@selector(nextAction:)],
                        nil];

    self.dataSource = dataSource;
}

- (void)loadView {
    [super loadView];
    [self prepareDataSource];

    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                               style:UIBarButtonItemStylePlain 
                                                                              target:self
                                                                              action:@selector(nextAction:)] autorelease];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	//[self.navigationController setToolbarHidden:YES animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

}

@end
