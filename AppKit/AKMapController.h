//
//  AKMapController.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/06.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "AKBaseViewController.h"

@interface AKMapController : AKBaseViewController {
    MKMapView *_mapView;
}

@property (nonatomic, readonly) MKMapView *mapView;

@end
