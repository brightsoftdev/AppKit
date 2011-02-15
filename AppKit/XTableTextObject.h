//
//  XTableViewTextObject.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTableObject.h"


@interface XTableTextObject : XTableObject {
	NSString *_text;
}

@property (nonatomic, copy) NSString *text;

+ (id)itemWithText:(NSString *)text;

@end
