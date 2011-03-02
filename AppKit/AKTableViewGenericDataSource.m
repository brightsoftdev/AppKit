//
//  XTableViewGenericDataSource.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableViewGenericDataSource.h"
#import "Global.h"

@class AKTableObject;
@implementation AKTableViewGenericDataSource
@synthesize sectionTitles = _sectionTitles;
@synthesize sectionFooters = _sectionFooters;
@synthesize items = _items;

- (void)dealloc {
    RELEASE(_items);
    RELEASE(_sectionTitles);
    RELEASE(_sectionFooters);
    [super dealloc];
}

- (AKTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [_items objectAtIndex:indexPath.section];
    if ([object isKindOfClass:[NSArray class]]) {
        return [(NSArray *)object objectAtIndex:indexPath.row];
    } else {
        return object;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForObject:(id)object {
    // scan level 1
    NSUInteger index = [_items indexOfObject:object];
    if (index != NSNotFound) {
        return [NSIndexPath indexPathForRow:0 inSection:index];
    }
    
    for (id itemObject in _items) {
        if ([itemObject isKindOfClass:[NSArray class]]) {
            NSUInteger index = [itemObject indexOfObject:object];
            if (index != NSNotFound) {
                NSUInteger section = [_items indexOfObject:itemObject];
                return [NSIndexPath indexPathForRow:index inSection:section];
            }
        }
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_items) {
        return _items.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_items) {
        id object = [_items objectAtIndex:section];
        if ([object isKindOfClass:[NSArray class]]) {
            return [(NSArray *)object count];
        } else {
            return 1;
        }
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section < _sectionTitles.count) {
        return [_sectionTitles objectAtIndex:section];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section < _sectionFooters.count) {
        return [_sectionFooters objectAtIndex:section];
    }
    return nil;
}

@end
