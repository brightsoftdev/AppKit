//
//  XTableViewTextObject.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableTextObject.h"
#import "AKTableTextCell.h"
#import "Global.h"

@implementation AKTableTextObject

@synthesize text = _text;

+ (Class)cellClass {
    return [AKTableTextCell class];
}

+ (id)itemWithText:(NSString *)text {
    AKTableTextObject *object = [[[[self class] alloc] init] autorelease];
    if (object) {
        object.text = text;
    }
    return object;
}

+  (id)itemWithText:(NSString *)text delegate:(id)delegate selector:(SEL)selector {
    AKTableTextObject *object = [self itemWithText:text];
    if (object) {
        object.delegate = delegate;
        object.selector = selector;
    }
    return object;
}

- (void)dealloc {
    RELEASE(_text);
    [super dealloc];
}

@end
