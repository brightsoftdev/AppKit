//
//  AKMapController
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/06.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKMapController.h"


@implementation AKMapController
@synthesize mapView = _mapView;

- (id)inlllitWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        //
        //self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    //self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mapView.frame = self.view.frame;
    self.mapView.showsUserLocation = YES;
}

- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

@end
