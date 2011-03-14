//
//  XTableViewDelegate.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableViewDelegate.h"
#import "AKTableViewDataSource.h"
#import "AKTableObject.h"

@implementation AKTableViewDelegate

- (id)init {
    if (self = [super init]) {
        //
        NSLog(@"delegate init");
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AKTableViewDataSource *dataSource = tableView.dataSource;
    id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
    if ([object isKindOfClass:[AKTableObject class]]) {
        AKTableObject *tableObject = object;
        if (tableObject.enabled && [tableObject.delegate respondsToSelector:tableObject.selector]) {
            [tableObject.delegate performSelector:tableObject.selector withObject:tableObject];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
- (void)tableView:(UITableView *)tableView didLongPressRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    NSLog(@"longPressed.");
}
*/
@end
