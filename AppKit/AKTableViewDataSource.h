//
//  XTableViewDataSource.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AKTableObject;
@interface AKTableViewDataSource : NSObject <UITableViewDataSource> {

}

- (AKTableObject *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath*)tableView:(UITableView*)tableView indexPathForObject:(id)object;

@end
