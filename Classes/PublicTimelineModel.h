//
//  PublicTimelineModel.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

@interface PublicTimelineModel : AKModel <AKURLRequestDelegate> {
    NSMutableArray *_tweets;
}

@property (nonatomic, readonly) NSMutableArray *tweets;

@end
