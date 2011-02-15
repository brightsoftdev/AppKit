//
//  PublicTimelineModel.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "PublicTimelineModel.h"
#import "TweetObject.h"

@implementation PublicTimelineModel
@synthesize tweets = _tweets;

- (id)init {
    if (self = [super init]) {
        _tweets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    RELEASE(_tweets)
    [super dealloc];
}

- (void)load {
    [super load];

    AKURLRequest *request = [AKURLRequest requestWithURL:@"http://api.twitter.com/1/statuses/public_timeline.json"
                                                delegate:self];
    [request start];

//    [self didFinishLoad];
}

- (void)requestDidFinishLoading:(AKURLRequest *)request {
    NSString *responseString = [[[NSString alloc] initWithData:request.data encoding:NSUTF8StringEncoding] autorelease];
    id JSONObject = [responseString JSONValue];
    
    if ([JSONObject isKindOfClass:[NSArray class]]) {

        [_tweets removeAllObjects];

        NSArray *items = JSONObject;
        for (id object in items) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary *item = object;
                
                TweetObject *tweet = [[[TweetObject alloc] init] autorelease];
                tweet.text = [item objectForKey:@"text"];
                [_tweets addObject:tweet];

            }
            
        }
    }
    
    [self didFinishLoad];
}

@end
