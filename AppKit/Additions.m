//
//  NSObject+Additions.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Additions.h"
#import "AKTableViewControlCell.h"

@implementation NSObject (Additions)
@end

/*
CGRect XRectMakeWithPointSize() {
	
}*/

@implementation UIView (Additions)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)value {
    self.frame = CGRectMake(value, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)value {
    self.frame = CGRectMake(self.frame.origin.x, value, self.frame.size.width, self.frame.size.height);
}


- (CGFloat)width {
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)value {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, value, self.frame.size.height);
}

- (CGFloat)height {
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)value {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, value);
}

/*
- (void)setWidth:(CGFloat)value {
	//
}
*/

- (CGPoint)origin {
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)point {
	//self.frame = CGRectMake(point.x, point.y, self., <#CGFloat height#>)
}

@end

@implementation UIViewController (Additions)
+ (UIViewController *)push {
    AKBaseViewController *controller = [[self alloc] initWithNibName:nil bundle:nil];
    [[AKNavigationController shared] pushViewController:controller animated:YES];
    
    return controller;
}
@end


@implementation UITextField (Additions)
+ (Class)cellClass {
	return [AKTableViewControlCell class];
}
@end

@implementation UIAlertView (Additions)

+ (UIAlertView *)alertWithMessage:(NSString *)message {
	UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:AKBundleDisplayName()
														 message:message
														delegate:nil
											   cancelButtonTitle:nil
											   otherButtonTitles:@"OK", nil] autorelease];
	//[alertView show];
	return alertView;
}

+ (UIAlertView *)showAlertWithMessage:(NSString *)message {
	UIAlertView *alertView = [self alertWithMessage:message];
	[alertView show];
	return alertView;
}

@end
