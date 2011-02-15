//
//  XTableViewDataSource.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XTableObject;
@interface XTableViewDataSource : NSObject <UITableViewDataSource> {

}

- (XTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath*)tableView:(UITableView*)tableView indexPathForObject:(id)object;

@end
