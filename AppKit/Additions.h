//
//  NSObject+Additions.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppKit.h"

@interface NSObject (Additions)
@end

@interface UIView (Additions)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@end

@interface UIViewController (Additions)
+ (UIViewController *)push;
@end


@interface UITextField (Additions)
+ (Class)cellClass;
@end

@interface UIAlertView (Additions)
+ (UIAlertView *)alertWithMessage:(NSString *)message;
+ (UIAlertView *)showAlertWithMessage:(NSString *)message;
@end
