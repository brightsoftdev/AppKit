//
//  XTableViewCell.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AKTableCell : UITableViewCell {
	id _object;
	BOOL _enabled;
}

@property (nonatomic, retain) id object;
@property (nonatomic, assign) BOOL enabled;

@end
