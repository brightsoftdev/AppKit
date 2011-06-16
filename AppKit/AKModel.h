//
//  AKModel.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

@class AKModel;
@protocol AKModelProtocol <NSObject>
@optional
- (void)modelDidStartLoad:(AKModel *)model;
- (void)modelDidFinishLoad:(AKModel *)model;
- (void)modelDidFailLoadWithError:(NSError*)error;
- (void)modelDidChange:(AKModel *)model;
@end

/*
 * A Model is a simple object that holds data.
 */
@interface AKModel : NSObject <AKModelProtocol> {
    BOOL _modified;
    NSMutableSet *_delegates;
}

@property (nonatomic, readonly) NSMutableSet *delegates;

- (void)load;
- (void)save;

- (void)didStartLoad;
- (void)didFinishLoad;
- (void)didFailLoadWithError;
- (void)didChange;

@end
