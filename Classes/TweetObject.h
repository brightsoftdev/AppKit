//
//  TweetObject.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TweetObject : NSObject {
    NSString *_text;
}

@property (nonatomic, copy) NSString *text;

@end
