//
//  XURLRequest.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKURLRequest;
@protocol XURLRequestDelegate <NSObject>
@optional
- (void)requestDidStartLoad:(AKURLRequest *)request;
- (void)requestDidFinishLoading:(AKURLRequest *)request;
- (void)request:(AKURLRequest *)request didFailWithError:(NSError *)error;
@end


@interface AKURLRequest : NSObject {
    NSString *_URL;
    id <XURLRequestDelegate> _delegate;
    NSURLRequest *_request;
    NSURLConnection *_connection;
    NSMutableData *_data;
}

@property (nonatomic, copy) NSString *URL;
@property (nonatomic, assign) id <XURLRequestDelegate> delegate;
@property (nonatomic, readonly) NSMutableData *data;

+ (AKURLRequest *)requestWithURL:(NSString *)URL delegate:(id<XURLRequestDelegate>)delegate;
- (void)start;

@end
