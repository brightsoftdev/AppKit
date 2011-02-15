//
//  AKModel.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKModel;
@protocol AKModelProtocol <NSObject>
- (void)modelDidStartLoad:(AKModel *)model;
- (void)modelDidFinishLoad:(AKModel *)model;
- (void)modelDidFailLoadWithError:(NSError*)error;
- (void)modelDidChange:(AKModel *)model;
@end

/*
 * A Model is a simple object that holds data.
 */
@interface AKModel : NSObject {
    NSMutableSet *_delegates;
}

@end
