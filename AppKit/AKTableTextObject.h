//
//  XTableViewTextObject.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKTableObject.h"


@interface AKTableTextObject : AKTableObject {
	NSString *_text;
}

@property (nonatomic, copy) NSString *text;

+ (id)itemWithText:(NSString *)text;
+ (id)itemWithText:(NSString *)text delegate:(id)delegate selector:(SEL)selector;

@end
