//
//  XURLRequest.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "AKURLRequest.h"
#import "AKGlobalNetwork.h"
#import "Global.h"

@implementation AKURLRequest
@synthesize URL = _URL;
@synthesize delegate = _delegate;
@synthesize data = _data;

// --------------------------------------------------

+ (AKURLRequest *)requestWithURL:(NSString *)URL delegate:(id <AKURLRequestDelegate>)delegate {
    AKURLRequest *request = [[[self alloc] init] autorelease];
    request.URL = URL;
    request.delegate = delegate;
    return request;
}

// --------------------------------------------------

- (void)dealloc {
    RELEASE(_URL);
    RELEASE(_data);
    [super dealloc];
}

// --------------------------------------------------

- (void)start {
    RELEASE(_data);
    _request = [NSURLRequest requestWithURL:[NSURL URLWithString:_URL]
                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                            timeoutInterval:30.0];
    _connection = [NSURLConnection connectionWithRequest:_request delegate:self];

    AKNetworkRequestStarted();
    
    if ([self.delegate respondsToSelector:@selector(requestDidStartLoad:)]) {
        [self.delegate requestDidStartLoad:self];
    }
}

// --------------------------------------------------

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (!_data) {
        _data = [[NSMutableData alloc] init];
    }
    [_data appendData:data];
}

// --------------------------------------------------

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if ([self.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
        [self.delegate requestDidFinishLoading:self];
    }
    AKNetworkRequestStopped();
}

// --------------------------------------------------

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
        [self.delegate request:self didFailWithError:error];
    }
    AKNetworkRequestStopped();
}

// --------------------------------------------------

@end
