//
//  AKWebController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/24.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKWebController.h"
#import "Global.h"
#import "AKGlobalNetwork.h"

@interface AKWebController()
- (UIBarButtonItem *)flexibleSpace;
//- (void)setDefaultToolbarItems;
//- (void)setLoadingToolbarItems;
- (UIActionSheet *)otherActionSheet;
@end

@implementation AKWebController
@synthesize initialURL = _initialURL;

// --------------------------------------------------

- (UIBarButtonItem *)flexibleSpace {
    return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                          target:nil
                                                          action:nil] autorelease];
}

- (UIActionSheet *)otherActionSheet {
    return [[[UIActionSheet alloc] initWithTitle:nil
                                         delegate:self
                                cancelButtonTitle:LOCSTR(@"Cancel")
                          destructiveButtonTitle:nil
                               otherButtonTitles:LOCSTR(@"Open in Safari"), nil] autorelease];
}

// --------------------------------------------------

#pragma mark -
#pragma mark actions

- (void)backAction:(id)sender {
    [_webView goBack];
}

// --------------------------------------------------

- (void)forwardAction:(id)sender {
    [_webView goForward];
}

// --------------------------------------------------

- (void)refreshAction:(id)sender {
    [_webView reload];
}

// --------------------------------------------------

- (void)stopAction:(id)sender {
    [_webView stopLoading];
}

// --------------------------------------------------

- (void)otherAction:(id)sender {
    [[self otherActionSheet] showInView:self.navigationController.view];
}

// --------------------------------------------------

#pragma mark -
#pragma mark delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //_webView.
        [[UIApplication sharedApplication] openURL:_webView.request.URL];
    }
}

// --------------------------------------------------

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.title = LOCSTR(@"Loading...");
    
    [_dynamicToolbarItems replaceObjectAtIndex:5
                                    withObject:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                              target:self
                                                                                              action:@selector(stopAction:)] autorelease]];
    
    [self setToolbarItems:nil];
    [self setToolbarItems:_dynamicToolbarItems];

    _backButton.enabled = NO;
    _forwardButton.enabled = NO;
    
    AKNetworkRequestStarted();
}

// --------------------------------------------------

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString* documentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = documentTitle;

    _backButton.enabled = _webView.canGoBack;
    _forwardButton.enabled = _webView.canGoForward;
    
    [_dynamicToolbarItems replaceObjectAtIndex:5
                                    withObject:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                              target:self
                                                                                              action:@selector(refreshAction:)] autorelease]];

    [self setToolbarItems:nil];
    [self setToolbarItems:_dynamicToolbarItems];

    AKNetworkRequestStopped();
}

// --------------------------------------------------

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self webViewDidFinishLoad:webView];
}

// --------------------------------------------------

#pragma mark -
#pragma mark controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        _backButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                                        style:UIBarButtonItemStylePlain 
                                                       target:self
                                                       action:@selector(backAction:)] autorelease];
        _forwardButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward"]
                                                           style:UIBarButtonItemStylePlain 
                                                          target:self
                                                          action:@selector(forwardAction:)] autorelease];
        
        _dynamicToolbarItems = [[NSMutableArray alloc] initWithObjects:
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
    }
    return self;
}

// --------------------------------------------------

- (id)initWithURL:(NSString *)URL {
    if (self = [self initWithNibName:nil bundle:nil]) {
        self.initialURL = URL;
    }
    return self;
}

// --------------------------------------------------

- (void)dealloc {
    _webView.delegate = nil;
    RELEASE(_dynamicToolbarItems)
    RELEASE(_initialURL)
    [super dealloc];
}

// --------------------------------------------------

- (void)loadView {
    _webView = [[[UIWebView alloc] init] autorelease];
    _webView.delegate = self;
    self.view = _webView;

    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_initialURL]]];
}

// --------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setToolbarItems:_dynamicToolbarItems];
    [self.navigationController setToolbarHidden:NO];
}

// --------------------------------------------------

@end
