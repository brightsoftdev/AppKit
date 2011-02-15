//
//  Controller.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestController1 : AKTableViewController <UITextFieldDelegate> {
	AKTableViewGenericDataSource *_dataSource;
	AKTableViewDelegate *_delegate;
}

@end
