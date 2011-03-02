//
//  XTableViewGenericDataSource.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKTableViewDataSource.h"

@interface AKTableViewGenericDataSource : AKTableViewDataSource {
    NSMutableArray *_sectionTitles;
    NSMutableArray *_sectionFooters;
    NSMutableArray *_items;
}

@property (nonatomic, retain) NSMutableArray *sectionTitles;
@property (nonatomic, retain) NSMutableArray *sectionFooters;
@property (nonatomic, retain) NSMutableArray *items;

@end
