//
//  XGlobalNetwork.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "XGlobalNetwork.h"
#import <UIKit/UIKit.h>
#import <pthread.h>

static int              gNetworkTaskCount = 0;
static pthread_mutex_t  gMutex = PTHREAD_MUTEX_INITIALIZER;


///////////////////////////////////////////////////////////////////////////////////////////////////
void XNetworkRequestStarted() {
    pthread_mutex_lock(&gMutex);
    
    if (0 == gNetworkTaskCount) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
    gNetworkTaskCount++;
    
    pthread_mutex_unlock(&gMutex);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void XNetworkRequestStopped() {
    pthread_mutex_lock(&gMutex);
    
    --gNetworkTaskCount;
    // If this asserts, you don't have enough stop requests to match your start requests.
    //ASSERT(gNetworkTaskCount >= 0);
    gNetworkTaskCount = MAX(0, gNetworkTaskCount);
    
    if (gNetworkTaskCount == 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    pthread_mutex_unlock(&gMutex);
}
