//
//  WebAppController.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/10.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKBaseViewController.h"

@interface AKWebAppController : AKBaseViewController <UIWebViewDelegate> {
    NSString *_initialURL;
    /*
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_forwardButton;
    */
    UIBarButtonItem *_refreshButton;
    NSMutableArray *_webToolbarItems;
    UIWebView *_webView;
//    UIView *_overlayView;
}

@property (nonatomic, copy) NSString *initialURL;
@property (nonatomic, readonly) UIWebView *webView;
//@property (nonatomic, retain) UIView *overlayView;

- (id)initWithInitialURL:(NSString *)initialURL;

@end
