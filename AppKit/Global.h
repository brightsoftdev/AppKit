//
//  Global.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define RELEASE(__POINTER) { [__POINTER release]; __POINTER = nil; }
#define LOCSTR(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

static inline CGRect AKScreenBounds() {
	return [UIScreen mainScreen].bounds;
}

static inline CGRect AKApplicationFrame() {
	return [UIScreen mainScreen].applicationFrame;
}

static inline NSString *AKBundleDisplayName() {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
