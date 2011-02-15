//
//  XGlobalNetwork.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Increment the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void AKNetworkRequestStarted();

/**
 * Decrement the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void AKNetworkRequestStopped();

