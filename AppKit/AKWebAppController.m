//
//  WebAppController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/10.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKWebAppController.h"
#import "Global.h"
#import "AKGlobalNetwork.h"
#import "Additions.h"
#import "AKLoadingView.h"

@implementation AKWebAppController
@synthesize initialURL = _initialURL;
@synthesize webView = _webView;
//@synthesize overlayView = _overlayView;

// --------------------------------------------------

- (UIBarButtonItem *)flexibleSpace {
    return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                          target:nil
                                                          action:nil] autorelease];
}

// --------------------------------------------------

#pragma mark -
#pragma mark delegates



// --------------------------------------------------

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //self.title = LOCSTR(@"Loading...");

    AKNetworkRequestStarted();
}

// --------------------------------------------------

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *documentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = documentTitle;
    //self.overlayView = nil;
    AKNetworkRequestStopped();
    
    /*
    [self setToolbarItems:[NSArray arrayWithObjects:
                           [self flexibleSpace],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                         target:nil
                                                                         action:nil],
                           [self flexibleSpace],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                         target:nil
                                                                         action:nil],
                           [self flexibleSpace],
                           nil] animated:YES];
    */
}

// --------------------------------------------------

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self webViewDidFinishLoad:webView];
}

// --------------------------------------------------

- (NSString *)absoluteURLStringFromURL:(NSString *)URLString {
    NSString *baseURLString = [_webView stringByEvaluatingJavaScriptFromString:@"document.baseURI;"];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *absoluteURL = [NSURL URLWithString:URLString relativeToURL:baseURL];
    return [absoluteURL absoluteString];
}

// --------------------------------------------------

- (void)pushViewControllerWithURL:(NSString *)URL {
    [[[[[self class] alloc] initWithInitialURL:[self absoluteURLStringFromURL:URL]] autorelease] push];
}

// --------------------------------------------------

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}


// --------------------------------------------------

- (void)popToRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// --------------------------------------------------

- (void)popToRootViewControllerWithURL:(NSString *)URL {
    NSLog(@"popToRootViewControllerWithURL : %@", URL);
    
    UIViewController *rootViewController = [self.navigationController.viewControllers objectAtIndex:0];
    //NSLog(@"rootViewController : %@", rootViewController);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    //NSLog(@"viewControllers FIRST : %@", self.navigationController.viewControllers);

    if ([rootViewController isKindOfClass:[AKWebAppController class]]) {
        NSLog(@"AKWebAppController Class");
        AKWebAppController *webAppController = (AKWebAppController *)rootViewController;
        [webAppController.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self absoluteURLStringFromURL:URL]]]];
    //} else {
    //    NSLog(@"oops........... %@", NSStringFromClass([self.navigationController.topViewController class]));
    //    NSLog(@"viewControllers : %@", self.navigationController.viewControllers);
    }

}

// --------------------------------------------------

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //NSLog(@"shouldStartLoad : %@", request);
/*
    UIWebViewNavigationTypeLinkClicked,
    UIWebViewNavigationTypeFormSubmitted,
    UIWebViewNavigationTypeBackForward,
    UIWebViewNavigationTypeReload,
    UIWebViewNavigationTypeFormResubmitted,
    UIWebViewNavigationTypeOther
 */
    NSURL *url = request.URL;

    NSLog(@"shouldStartLoadWithRequest : %@, parameters : %@", [url absoluteString], [url parameters]);
/*
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[[[[self class] alloc] initWithInitialURL:[request.URL absoluteString]] autorelease] push];
        return NO;
    } else {
        //
*/
        NSDictionary *urlParameters = [url parameters];
        NSString *selectorString = [urlParameters valueForKey:@"selector"];
        NSString *argumentsString = [urlParameters valueForKey:@"arguments"];
        
        if (selectorString) {
            BOOL respondsToSelector = [self respondsToSelector:NSSelectorFromString(selectorString)];
            
            if (respondsToSelector) {
                    
                NSLog(@"selector : %@", selectorString);
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:NSSelectorFromString(selectorString)]];
                [invocation setTarget:self];
                [invocation setSelector:NSSelectorFromString(selectorString)];
                
                if (argumentsString) {
                    NSLog(@"argumentString : %@", argumentsString);
                    NSArray *arguments = [argumentsString JSONValue];
                    NSLog(@"arguments : %@", arguments);
                    if ([arguments isKindOfClass:[NSArray class]]) {
                        //NSLog(@"isArray");
                        for (int i = 0; i < arguments.count; i++) {
                            NSObject *argument = [arguments objectAtIndex:i];
                            NSLog(@"argument : %@", argument);
                            [invocation setArgument:&argument atIndex:i + 2];
                            
                            //NSString *s = @"xxxxxxxx";
                            //[invocation setArgument:&s atIndex:2];
                            //self.title = @"xsfsafafd";
                        }
                    }
                }
                
                
                [invocation invoke];
            
                return NO;
            }
            
        }
        
    //}
    /*
    if ([[url scheme] isEqualToString:@"http"]) {
        return YES;
    }
    */
    return YES;
}

// --------------------------------------------------

- (void)refreshAction:(id)sender {
    [_webView reload];
}

// --------------------------------------------------

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = LOCSTR(@"Loading...");

        _refreshButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                        target:self
                                                                        action:@selector(refreshAction:)] autorelease];
        self.navigationItem.rightBarButtonItem = _refreshButton;

        /*
        _backButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                                        style:UIBarButtonItemStylePlain 
                                                       target:self
                                                       action:@selector(backAction:)] autorelease];
        
        _forwardButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward"]
                                                           style:UIBarButtonItemStylePlain 
                                                          target:self
                                                          action:@selector(forwardAction:)] autorelease];
         */
        
         /*
        _webToolbarItems = [[NSMutableArray alloc] initWithObjects:
                            [self flexibleSpace],
                            _backButton,
                            [self flexibleSpace],
                            _forwardButton,
                            [self flexibleSpace],
                            [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                           target:self
                                                                           action:@selector(refreshAction:)] autorelease],
                            
                            [self flexibleSpace],
                            [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                           target:self
                                                                           action:@selector(otherAction:)] autorelease],
                            [self flexibleSpace],
                            nil];
*/
//        self.toolbarItems = _webToolbarItems;

    }
    return self;
}

// --------------------------------------------------

- (id)initWithInitialURL:(NSString *)initialURL {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        self.initialURL = initialURL;
    }
    return self;
}

// --------------------------------------------------

- (void)dealloc {
    if (_webView.loading) {
        AKNetworkRequestStopped();
    }

    _webView.delegate = nil;
    //RELEASE(_webView)
    RELEASE(_initialURL)
    RELEASE(_overlayView)
    [super dealloc];
}

// --------------------------------------------------

- (void)loadView {
    _webView = [[[UIWebView alloc] init] autorelease];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    
    //_webView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    /*
    for (id subview in _webView.subviews) {
        if ([[subview class] isSubclassOfClass: [UIScrollView class]]) {
            ((UIScrollView *)subview).backgroundColor = [UIColor groupTableViewBackgroundColor];
        }
        if ([[subview class] isKindOfClass:[UIImageView class]]) {
            NSLog(@"imageView");
            ((UIImageView *)subview).hidden = YES;
        }
    }*/
/*
    for(id *subview in [[[_webView subviews] objectAtIndex:0] subviews]) { 
        if([subview isKindOfClass:[UIImageView class]]) {
            ((UIImageView *)subview).hidden = YES;
        } 
    }  

*/
    self.view = _webView;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_initialURL]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.overlayView = [[[AKLoadingView alloc] initWithFrame:self.view.frame] autorelease];
}

// --------------------------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.tableView.hidden = YES;
    
}


/*
- (void)setOverlayView:(UIView *)value {
    if (value) {
        value.frame = self.view.frame;
        [self.view addSubview:value];
    }
    
    [_overlayView removeFromSuperview];
    [_overlayView release];
    _overlayView = [value retain];
}
*/
@end
