//
//  XImageView
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 netsystems. All rights reserved.
//

#import "XImageView.h"
#import "Global.h"

@implementation XImageView
@synthesize imageURL = _imageURL;
//@synthesize defaultImage = _defaultImage;

// ----------------------------------------

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.backgroundColor = [UIColor whiteColor];

        _defaultImageView = [[UIImageView alloc] initWithFrame:frame];
        _defaultImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_defaultImageView];
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.contentMode = UIViewContentModeCenter;
        _activityIndicatorView.hidesWhenStopped = YES;
        [_activityIndicatorView startAnimating];
        [self addSubview:_activityIndicatorView];
        
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
    }
    return self;
}

// ----------------------------------------

- (void)dealloc {
    //RELEASE(_defaultImage);
    RELEASE(_activityIndicatorView);
    RELEASE(_defaultImageView);
    RELEASE(_imageView);
    RELEASE(_imageURL);
    [super dealloc];
}

// ----------------------------------------

- (void)layoutSubviews {
    [super layoutSubviews];
    _defaultImageView.frame = self.frame;
    _activityIndicatorView.frame = self.frame;
    _imageView.frame = self.frame;
}

// ----------------------------------------

- (void)setDefaultImage:(UIImage *)value {
    /*[_defaultImage release];
    _defaultImage = [value retain];
    */
    
    _defaultImageView.image = value;
}

// ----------------------------------------

- (UIImage *)defaultImage {
    return _defaultImageView.image;
}

// ----------------------------------------

- (void)setImageURL:(NSString *)value {
    [_imageURL release];
    _imageURL = [value copy];

    _request = [XURLRequest requestWithURL:_imageURL delegate:self];
    [_request start];
}

// ----------------------------------------

- (void)fadeInAnimationDidStop:(id)sender {
    [_activityIndicatorView stopAnimating];
}

// ----------------------------------------

- (void)requestDidFinishLoading:(XURLRequest *)request {
    _imageView.alpha = 0.0;
    _imageView.image = [[[UIImage alloc] initWithData:request.data] autorelease];

    [UIView beginAnimations:nil context:NULL]; {
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.5];
        //[UIView setAnimationDelegate:self];
        //[UIView setAnimationDidStopSelector:@selector(fadeInAnimationDidStop:)];
        [_activityIndicatorView stopAnimating];
        _imageView.alpha = 1.0;
    } [UIView commitAnimations];
}

// ----------------------------------------

- (void)request:(XURLRequest *)request didFailWithError:(NSError *)error {
    [_activityIndicatorView stopAnimating];
}

// ----------------------------------------

@end
