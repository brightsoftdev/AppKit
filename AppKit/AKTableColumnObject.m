//
//  AKTableColumnObject.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/06.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKTableColumnObject.h"
#import "AKTableColumnCell.h"


@implementation AKTableColumnObject

+ (Class)cellClass {
    return [AKTableColumnCell class];
}


@end
