//
//  XTableImageObject.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/02/02.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTableTextObject.h"

@interface XTableImageObject : XTableTextObject {
    NSString *_imageURL;
}

@property (nonatomic, copy) NSString *imageURL;

@end
