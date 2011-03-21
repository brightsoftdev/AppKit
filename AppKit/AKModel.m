//
//  AKModel.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "AKModel.h"
#import "Global.h"
#import "Additions.h"

@implementation AKModel
@synthesize delegates = _delegates;

- (id)init {
    if ((self = [super init])) {
        _delegates = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)dealloc {
    RELEASE(_delegates)
    [super dealloc];
}

- (void)load {

}

- (void)save {

}

- (void)didStartLoad {
    [_delegates performSelectorOnObjects:@selector(modelDidStartLoad:) withObject:self];
}

- (void)didFinishLoad {
    [_delegates performSelectorOnObjects:@selector(modelDidFinishLoad:) withObject:self];
}

- (void)didFailLoadWithError {
    [_delegates performSelectorOnObjects:@selector(modelDidFailLoadWithError:) withObject:self];
}

- (void)didChange {
    [_delegates performSelectorOnObjects:@selector(modelDidChange:) withObject:self];
}

@end
