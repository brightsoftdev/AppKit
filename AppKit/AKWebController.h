//
//  AKWebController.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/24.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AKBaseViewController.h"

@interface AKWebController : AKBaseViewController <UIWebViewDelegate, UIActionSheetDelegate> {
    NSString *_initialURL;

    UIWebView *_webView;
    NSMutableArray *_dynamicToolbarItems;
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_forwardButton;
    
    NSMutableArray *_webToolbarItems;
}

@property (nonatomic, copy) NSString *initialURL;

- (id)initWithURL:(NSString *)URL;

@end
