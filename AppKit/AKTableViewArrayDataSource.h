//
//  XTableViewArrayDataSource.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKTableViewDataSource.h"

@interface AKTableViewArrayDataSource : AKTableViewDataSource {
    NSMutableArray *_items;
}

@property (nonatomic, retain) NSMutableArray *items;

@end
