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

@interface AKWebController : AKBaseViewController <UIWebViewDelegate> {
	UIWebView *_webView;
}
@end
