//
//  XTableViewObject.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AKTableObject : NSObject {
	BOOL _enabled;

	id _delegate;
	SEL _selector;

	UITableView *_tableView;
}

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) UITableView *tableView;

+ (Class)cellClass;
- (void)update;

@end
