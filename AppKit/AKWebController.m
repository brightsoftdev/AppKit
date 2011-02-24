//
//  AKWebController.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/24.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKWebController.h"
#import "Global.h"


@interface AKWebController()
- (UIBarButtonItem *)flexibleSpace;
- (void)setDefaultToolbarItems;
- (void)setLoadingToolbarItems;
@end

@implementation AKWebController

- (UIBarButtonItem *)flexibleSpace {
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
														  target:nil
														  action:nil] autorelease];
}

- (void)setDefaultToolbarItems {
	[self setToolbarItems:[NSArray arrayWithObjects:
						   [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																		  target:self
																		  action:@selector(refreshAction:)] autorelease],
						   [self flexibleSpace],
						   [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
																		  target:self
																		  action:@selector(otherAction:)] autorelease],
						   nil]];
}

- (void)setLoadingToolbarItems {
	[self setToolbarItems:[NSArray arrayWithObjects:
						   [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
																		  target:self
																		  action:@selector(stopAction:)] autorelease],
						   [self flexibleSpace],
						   [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
																		  target:self
																		  action:@selector(otherAction:)] autorelease],
						   nil]];
}

#pragma mark -
#pragma mark actions

- (void)refreshAction:(id)sender {
	[_webView reload];
}

- (void)stopAction:(id)sender {
	[_webView stopLoading];
}

- (void)otherAction:(id)sender {
	NSLog(@"otherAction");
}

#pragma mark -
#pragma mark delegates

- (void)webViewDidStartLoad:(UIWebView *)webView {
	self.title = LOCSTR(@"Loading...");
	[self setLoadingToolbarItems];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	NSString* documentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
	self.title = documentTitle;

	[self setDefaultToolbarItems];
	//NSLog(@"documentTitle : %@", documentTitle);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[self setDefaultToolbarItems];
}

#pragma mark -
#pragma mark controller

- (void)dealloc {
	_webView.delegate = nil;
	[super dealloc];
}

- (void)loadView {
	_webView = [[[UIWebView alloc] init] autorelease];
	_webView.delegate = self;
	self.view = _webView;

	[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]]];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setDefaultToolbarItems];
	[self.navigationController setToolbarHidden:NO];
}


@end
